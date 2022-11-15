using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.controllersLayout
{
    public class AboutController : Controller
    {
        // GET: About
        public ActionResult Index()
        {
            var model = new AboutDao().ListAllPaging();
            return View(model);
        }
    }
}