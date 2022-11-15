using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ProductTypeController : Controller
    {
        // GET: Admin/ProductType
        public ActionResult Index()
        {
            return View();
        }
        //Rolex
        public ActionResult RolexProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model=dao.ListRolexProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditRolexProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditRolexProduct(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.Update(product);
                if (result)
                {
                    return RedirectToAction("RolexProduct", "ProductType");
                }
                else
                {
                    ModelState.AddModelError("","Cập nhật không thành công");
                }

            }
            return View("RolexProduct");
        }
        [HttpDelete]
        public ActionResult DeleteRolexProduct(int id)
        {
            new ProductDao().Delete(id);
            return RedirectToAction("RolexProduct");
        }
        //Gucci
        public ActionResult GucciProduct(string searchString,int page=1,int pageSize=10)
        {
            var dao = new ProductTypeDao();
            var model=dao.ListGucciProduct(searchString, page, pageSize);
            ViewBag.SearchString=searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditGucciProduct(long id)
        {
            var product=new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditGucciProduct(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.Update(product);
                if (result)
                {
                    return RedirectToAction("GucciProduct", "ProductType");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("GucciProduct");
        }
        [HttpDelete]
        public ActionResult DeleteGucciProduct(int id)
        {
            new ProductDao().Delete(id);
            return View("GucciProduct");
        }
        //Oppo Product
        public ActionResult OppoProduct(string searchString,int page=1,int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListOppoProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditOppoProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditOppoProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("OppoProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("OppoProduct");
        }
        [HttpDelete]
        public ActionResult DeleteOppoProduct(int id)
        {
            new ProductDao().Delete(id);
            return View("OppoProduct");
        }
        //Iphone
        public ActionResult IphoneProduct(string searchString, int page = 1,int pageSize = 10)
        {
            var dao=new ProductTypeDao();
            var model=dao.ListIphoneProduct(searchString, page, pageSize);
            ViewBag.SearchString=searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditIphoneProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditIphoneProduct(Product product)
        {
            var dao = new ProductDao();
            var result=dao.Update(product);
            if (result)
            {
                return RedirectToAction("IphoneProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("IphoneProduct");
        }
        [HttpDelete]
        public ActionResult DeleteIphoneProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("IphoneProduct");
        }
        //Samsung
        public ActionResult SamsungProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListSamsungProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditSamsungProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditSamsungProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("SamsungProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("SamsungProduct");
        }
        [HttpDelete]
        public ActionResult DeleteSamsungProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("SamsungProduct");
        }
        //Case
        public ActionResult CaseProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListCaseProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditCaseProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditCaseProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("CaseProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("CaseProduct");
        }
        [HttpDelete]
        public ActionResult DeleteCaseProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("CaseProduct");
        }
        //PC
        public ActionResult PCProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListPCProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditPCProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditPCProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("PCProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("PCProduct");
        }
        [HttpDelete]
        public ActionResult DeletePCProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("PCProduct");
        }
        //DELL
        public ActionResult DellProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListDellProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditDellProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditDellProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("DellProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("DellProduct");
        }
        [HttpDelete]
        public ActionResult DeleteDellProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("DellProduct");
        }
        //Asus
        public ActionResult AsusProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListAsusProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditAsusProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditAsusProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("AsusProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("AsusProduct");
        }
        [HttpDelete]
        public ActionResult DeleteAsusProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("AsusProduct");
        }
        //Tai nghe Gaming
        public ActionResult TNGProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListTNGProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditTNGProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditTNGProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("TNGProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("TNGProduct");
        }
        [HttpDelete]
        public ActionResult DeleteTNGProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("TNGProduct");
        }
        //Loa Gaming
        public ActionResult LGProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListLGProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditLGProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditLGProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("LGProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("LGProduct");
        }
        [HttpDelete]
        public ActionResult DeleteLGProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("LGProduct");
        }
        //Giay the thao
        public ActionResult GTTProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListGTTProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditGTTProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditGTTProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("GTTProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("GTTProduct");
        }
        [HttpDelete]
        public ActionResult DeleteGTTProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("GTTProduct");
        }
        //Golf
        public ActionResult GolfProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListGolfProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditGolfProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditGolfProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("GolfProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("GolfProduct");
        }
        [HttpDelete]
        public ActionResult DeleteGolfProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("GolfProduct");
        }
        //Ao Hoodie
        public ActionResult HoodieProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListHoodieProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditHoodieProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditHoodieProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("HoodieProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("HoodieProduct");
        }
        [HttpDelete]
        public ActionResult DeleteHoodieProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("HoodieProduct");
        }
        //Quần Âu
        public ActionResult QAProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListQAProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditQAProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditQAProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("QAProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("QAProduct");
        }
        [HttpDelete]
        public ActionResult DeleteQAProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("QAProduct");
        }
        //Dây chuyền
        public ActionResult DCProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListDCProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditDCProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditDCProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("DCProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("DCProduct");
        }
        [HttpDelete]
        public ActionResult DeleteDCProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("DCProduct");
        }
        //Lắc tay
        public ActionResult LTProduct(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductTypeDao();
            var model = dao.ListLTProduct(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        [HttpGet]
        public ActionResult EditLTProduct(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult EditLTProduct(Product product)
        {
            var dao = new ProductDao();
            var result = dao.Update(product);
            if (result)
            {
                return RedirectToAction("LTProduct", "ProductType");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật không thành công");
            }
            return View("LTProduct");
        }
        [HttpDelete]
        public ActionResult DeleteLTProduct(int id)
        {
            new ProductDao().ViewDetail(id);
            return View("LTProduct");
        }
    }
}