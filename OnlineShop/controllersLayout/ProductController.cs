using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Common;
using Model.Dao;
using Model.EF;
using OnlineShop.Common;

namespace OnlineShop.controllersLayout
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryDao().listAll();
            return PartialView(model);
        }
        public JsonResult ListName(string q)
        {
            var data = new ProductDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Category(long cateId,string sort, int page = 1, int pageSize = 1)
        {
            var category = new CategoryDao().ViewDetail(cateId);
            ViewBag.Category = category;
            int totalRecord = 0;
            var model = new ProductDao().ListByCategoryId(cateId, ref totalRecord, page, pageSize);
            if(sort== "Popular")
            {
                model = model.Where(x=>x.Price>2500000).OrderByDescending(x => x.CreatedDate).ToList();
                
            }
            if(sort== "Discount")
            {
                model = model.OrderByDescending(x => x.Price).ToList();
                ViewBag.chon = "Discount";
            }
            if (sort == "New")
            {
                model = model.OrderByDescending(x => x.CreatedDate).ToList();
            }
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult Search(string keyword, int page = 1, int pageSize = 1)
        {


            int totalRecord = 0;
            var model = new ProductDao().Search(keyword, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.Keyword = keyword;
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult Detail(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            ViewBag.Category = new ProductCategoryDao().ViewDetail(product.CategoryID.Value);
            ViewBag.RelatedProducts = new ProductDao().ListRelatedProducts(id);
            var sessionUser = (UserLogin)Session[CommonContants.USER_SESSION];
            ViewBag.UserID = sessionUser.UserID;
            ViewBag.ListComment = new CommentDao().ListCommentViewModel(0, id);
            return View(product);
        }

        public ActionResult AllNewProduct()
        {

            var productDao = new ProductDao();
            ViewBag.NewProducts = productDao.ListNewProduct(12);
            ViewBag.ListFeatureProducts = productDao.ListFeatureProduct(12);
            ViewBag.ListDQProduct = productDao.ListDQProduct(12);
            return View();
        }
        [ChildActionOnly]
        public ActionResult _ChildComment(long parentid, long productid)
        {
            var data = new CommentDao().ListCommentViewModel(parentid, productid);
            var sessionuser = (UserLogin)Session[CommonContants.USER_SESSION];
            for (int k = 0; k < data.Count; k++)
            {
                data[k].UserID = sessionuser.UserID;

            }
            return PartialView("~/Views/Shared/_ChildComment.cshtml",data);
        }
        [HttpPost]
        public JsonResult AddNewComment(long productid,long userid,long parentid,string commentmsg,string rate)
        {
            try
            {
                 

                var dao = new CommentDao();
                Comment comment=new Comment();
                Random a = new Random();
                comment.ID = a.Next(2, 1000);
                comment.ProductID = productid;
                comment.UserID = userid;
                comment.CommentMsg = commentmsg;
                comment.CommentDate = DateTime.Now;
                comment.Rate=Convert.ToInt16(rate);

                bool addcomment = dao.Insert(comment);
                if (addcomment == true)
                {
                    return Json(new { status = true });
                }
                else
                {
                    return Json(new { status = false });
                }
            }
            catch
            {
                return Json(new { status = false });
            }
        }
        public ActionResult GetComment(long productid)
        {
            var data = new CommentDao().ListCommentViewModel(0, productid);
            return View(data);
        }
    }
}