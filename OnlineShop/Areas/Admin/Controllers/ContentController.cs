using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
/*using System.Web.UI.WebControls;*/

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ContentController : BaseController
    {
        // GET: Admin/Content
        public ActionResult Index(string searchString , int page=1, int pageSize=10)
        {
            var dao = new ContentDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;

            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpGet]
        public ActionResult Edit( long id)
        {
            var dao=new ContentDao();
            var content=dao.GetByID(id);

            SetViewBag(content.CategoryID);

            return View(content);
        }
        [HttpPost]
        public ActionResult Edit(Content content)
        {
            if (ModelState.IsValid)
            {
                var dao = new ContentDao();
                var result = dao.Update(content);
                if (result)
                {
                    return RedirectToAction("Index","Content");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật product thành công");
                }

            }
            SetViewBag();
            return View("Index");

        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Content model)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session[CommonContants.USER_SESSION];
                model.CreateBy = session.UserName;
                var culuture = Session[CommonContants.CurrentCulture];
                model.Language = culuture.ToString();
                new ContentDao().Create(model);
                return RedirectToAction("Index");
            }
            SetViewBag();
            return View();

        }
        

        
        public void  SetViewBag(long? selectedId=null)
        {
            var dao = new CategoryDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(),"ID","Name",selectedId);
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ContentDao().Delete(id);
            return View("Index");
        }

    }
}