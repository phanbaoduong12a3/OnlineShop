using Model.Dao;
using OnlineShop.Areas.Admin.Models;
using OnlineShop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
namespace OnlineShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        public object CommonContans { get; private set; }

        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                string v = Encryptor.MD5Hash(model.Password);
                var result = dao.Login(model.UserName, v,true);
                if (result==1)
                {
                    var user = dao.GetById(model.UserName);
                   /* UserLogin userLogin = new UserLogin();*/
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    userSession.GroupID = user.GroupID;
                    var listCredentials = dao.GetListCredential(model.UserName);
                    Session.Add(CommonContants.SESSION_CREDENTIALS, listCredentials);

                    Session.Add(CommonContants.USER_SESSION, userSession);
                    return RedirectToAction("Index","Home");
                }
                else if(result==0)
                {

                    ModelState.AddModelError("", "Tài khoản không tồn tại"); 
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản bị khoá");
                }
                else if(result==-2)
                {
                    ModelState.AddModelError("", "Mật khấu không đúng!");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập!");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng!");
                }
            }
            return View("Index");
        }
    }
}