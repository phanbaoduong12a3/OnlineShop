using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class AboutController : BaseController
    {
        // GET: Admin/About
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult About(string searching ,int page=1,int pagesize=10)
        {
            var dao = new AboutDao();
            var model=dao.ListAllAbout(searching,page,pagesize);
            ViewBag.searching = searching;
            return View(model);
        }
        [HttpGet]
        public ActionResult AddAbout()
        {
            return View();
        }


        [HttpPost]
        public ActionResult AddAbout(About s)
        {
            if (ModelState.IsValid)
            {
                var dao = new AboutDao();
                long id=dao.Insert(s);
                if (id > 0)
                {
                    SetAlert("Thêm mới thành công", "success");
                    return RedirectToAction("About", "About");
                }
                else
                {
                    SetAlert("Thêm sản phẩm không thành công", "error");
                }
            }
            return View("About", "About");

        }
        [HttpGet]
        public ActionResult EditAbout(long id)
        {
            var about = new AboutDao().ViewDetail(id);
            return View(about);
        }
        [HttpPost]
        public ActionResult EditAbout(About s)
        {
            if (ModelState.IsValid)
            {
                var dao = new AboutDao();
                var result=dao.UpdateAbout(s);
                if (result)
                {
                    SetAlert("Sửa thành công", "success");
                    return RedirectToAction("About", "About");
                }
                else
                {
                    SetAlert("Sửa không thành công", "error");
                }
            }
            return View("About", "About");
        }
        [HttpDelete]
        public ActionResult DeleteAbout(long id)
        {
            new AboutDao().DeleteAbout(id);
            return RedirectToAction("About", "About");
        }
    }
}