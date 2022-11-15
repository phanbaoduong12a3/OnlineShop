using Model.Dao;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.controllersLayout
{
    public class HomeController : Controller
    {
  

        // GET: Home
        public ActionResult Index()
        {
            ViewBag.Slides = new SlideDao().ListAll();
            var productDao = new ProductDao();
            ViewBag.NewProducts = productDao.ListNewProduct(4);
            ViewBag.ListFeatureProducts=productDao.ListFeatureProduct(4);
            ViewBag.ListDQProduct=productDao.ListDQProduct(4);
            return View();
        }
        [ChildActionOnly]
        /*[OutputCache(Duration =3600*24)]*/
        public ActionResult MainMenu()
        {
            var model=new MenuDao().ListByGroupId(1);
            return PartialView(model);
        }

        [ChildActionOnly]
   
        public ActionResult TopMenu()
        {
            var model = new MenuDao().ListByGroupId(2);
            return PartialView(model);
        }
        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[CommonContants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            /*var model = new MenuDao().ListByGroupId(2);*/
            return PartialView(list);
        }

        [ChildActionOnly]
  
        public ActionResult Footer()
        {
            var model = new FooterDao().GetFooter();
            return PartialView(model);
        }
    }
}