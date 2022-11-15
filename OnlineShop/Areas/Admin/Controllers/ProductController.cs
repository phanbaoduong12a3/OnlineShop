using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Edit(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        //NewProduct
        [HttpGet]
        public ActionResult EditNewProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        //DQProduct
        [HttpGet]
        public ActionResult EditDQProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        public ActionResult DQProduct(string searchString, int page = 1, int pageSize = 10, int top = 4)
        {
            var dao = new ProductDao();
            var model = dao.ListDQProduct(searchString, page, pageSize, top);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        public ActionResult NewProduct(string SearchString, int page = 1, int pageSize = 10,int top=4)
        {
            var dao = new ProductDao();
            var model=dao.ListNewProduct(SearchString, page, pageSize,top);
            ViewBag.SearchString = SearchString;
            return View(model);
        }

        public ActionResult HotProduct(string SearchString, int page=1, int pageSize=10)
        {
            var dao = new ProductDao();
            var model = dao.ListHotProduct(SearchString,page, pageSize);
            ViewBag.SearchString = SearchString;
            return View(model);
        }
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                long id = dao.Insert(product);
                if (id > 0)
                {
                    SetAlert("Thêm sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    SetAlert("Thêm sản phẩm không thành công", "error");
                }
            }
            return View("Index", "Home");

        }

        //HotProduct
        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result= dao.Update(product);
                if (result )
                {
                    return RedirectToAction("HotProduct", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật product thành công");
                }
            }
            return View("HotProduct");

        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ProductDao().Delete(id);
            return RedirectToAction("HotProduct");
        }

        //NewProduct
        [HttpPost]
        public ActionResult EditNewProduct(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.Update(product);
                if (result)
                {
                    return RedirectToAction("NewProduct", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật product k thành công");
                }
            }
            return View("NewProduct");

        }
        [HttpDelete]
        public ActionResult DeleteNewProduct(int id)
        {
            new ProductDao().Delete(id);
            return RedirectToAction("NewProduct");
        }

        //DQProduct
        [HttpPost]
        public ActionResult EditDQProduct(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.Update(product);
                if (result)
                {
                    return RedirectToAction("DQProduct", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật product k thành công");
                }
            }
            return View("DQProduct");

        }
        [HttpDelete]
        public ActionResult DeleteDQProduct(int id)
        {
            new ProductDao().Delete(id);
            return RedirectToAction("DQProduct");
        }

    }
}