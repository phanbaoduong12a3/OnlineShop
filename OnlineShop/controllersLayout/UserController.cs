using BotDetect.Web.Mvc;
using Facebook;
using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;

namespace OnlineShop.controllersLayout
{
    public class UserController : Controller
    {
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }

        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri= RedirectUri.AbsoluteUri,
                response_type="code",
                scope="email",

            }) ; 
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result =fb.Post("oauth/access_token",new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
               code=code,

            });
            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken= accessToken;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string email = me.email;
                string userName=me.email;
                string firstname=me.first_name;
                string middlename=me.middledle_name;
                string lastname = me.last_name;

                var user = new User();
                user.Email = email;
                user.UserName = email;
                user.Status = true;
                user.Name = firstname + " " + middlename + " " + lastname;
                user.CreateDate = DateTime.Now;
                var resultInsert = new UserDao().InsertForFacebook(user);
                if (resultInsert > 0)
                {
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    Session.Add(CommonContants.USER_SESSION, userSession);
                   
                }
               
            }
            return Redirect("/");

        }

        /// <summary>
        /// //
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            Session[CommonContants.USER_SESSION] = null;
            return Redirect("/");
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                string v = Encryptor.MD5Hash(model.Password);
                var result = dao.Login(model.UserName, v);
                if (result == 1)
                {
                    var user = dao.GetById(model.UserName);
                    UserLogin userLogin = new UserLogin();
                    var userSession = /*new UserLogin();*/ userLogin;
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;

                    Session.Add(CommonContants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else if (result == 0)
                {

                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản bị khoá");
                }
                else
                {
                    ModelState.AddModelError("", "Mật khấu không đúng!");
                }
            }
            return View(model);
        }

        [HttpPost]
        [CaptchaValidation("CaptchaCode", "registerCapcha", "Mã xác nhận không đúng!")]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    var user = new User();
                    user.Name = model.Name;
                    user.Email = model.Email;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Phone = model.Phone;
                    user.Address = model.Address;
                    user.CreateDate = DateTime.Now;
                    user.Status = true;
                    if (!string.IsNullOrEmpty(model.ProvinceID))
                    {
                        user.ProvinceID = int.Parse(model.ProvinceID);
                        
                    }
                    if (!string.IsNullOrEmpty(model.DistrictID))
                    {
                        user.ProvinceID = int.Parse(model.DistrictID);

                    }
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công ";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công ");
                    }

                }
            }
            return View(model);
        }
        //TInh/Thanh pho
        public JsonResult LoadProvince()
        {

            var xmlDoc = XDocument.Load(Server.MapPath(@"~/assests/client/data/Provinces_Data.xml"));
            var xElements = xmlDoc.Elements("Root").Elements("Item").Where(x => x.Attribute("type").Value == "province");
            var list = new List<ProvinceModel>();
            ProvinceModel province = null;
            foreach(var item in xElements)
            {
                province=new ProvinceModel();
                province.ID=int.Parse(item.Attribute("id").Value);
                province.Name = item.Attribute("value").Value;
                list.Add(province);

            }
            
            return Json(new
            {
                data = list,
                status = true
            });
        }

        //Quan/Huyen
        public JsonResult LoadDistrict(int provinceID)
        {

            var xmlDoc = XDocument.Load(Server.MapPath(@"~/assests/client/data/Provinces_Data.xml"));
            
            var xElement = xmlDoc.Elements("Root").Elements("Item").Single(x => x.Attribute("type").Value == "province" && int.Parse(x.Attribute("id").Value)==provinceID);
            
            var list = new List<DistrictModel>();
            DistrictModel district = null;
            foreach (var item in xElement.Elements("Item").Where(x=>x.Attribute("type").Value=="district"))
            {
                district = new DistrictModel();
                district.ID = int.Parse(item.Attribute("id").Value);
                district.Name = item.Attribute("value").Value;
                district.ProvinceID = int.Parse(xElement.Attribute("id").Value);
                list.Add(district);
            }

            return Json(new
            {
                data = list,
                status = true
            });
        }

    }
}