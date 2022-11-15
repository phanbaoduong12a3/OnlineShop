using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.ViewModel;
using PagedList;

namespace Model.Dao
{
    public class ProductDao
    {
        OnlineShopDbContext db = null;
        public ProductDao()
        {
            db= new OnlineShopDbContext();
        }
        public List<Product> ListNewProduct(int top)
        {
            return db.Products.OrderByDescending(x=>x.CreateDate).Take(top).ToList();
        }
        public IEnumerable<Product> ListAllProduct(string SearchString, int page, int pagesize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(SearchString))
            {
                model = model.Where(x => x.Name.Contains(SearchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pagesize);
        }
        public IEnumerable<Product> ListDQProduct(string searchString, int page,int pagesize,int top)
        {
            string COD = "A01";
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.Code == COD).OrderByDescending(x => x.CreateDate).Take(top).ToPagedList(page, pagesize);
        }
        public IEnumerable<Product> ListNewProduct(string SearchString, int page, int pagesize,int top)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(SearchString))
            {
                model = model.Where(x => x.Name.Contains(SearchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.OrderByDescending(x => x.CreateDate).Take(top).ToPagedList(page, pagesize);
        }

        public IEnumerable<Product> ListHotProduct(string SearchString,int page,int pagesize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(SearchString))
            {
                model = model.Where(x => x.Name.Contains(SearchString)).OrderByDescending(x=>x.CreateDate);
            }
            return model.Where(x => x.TopHot != null && x.TopHot > DateTime.Now).OrderByDescending(x=>x.CreateDate).ToPagedList(page,pagesize);
        }
        public List<string> ListName(string keyword)
        {
            return db.Products.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
        /// <summary>
        /// Get list product by category
        /// </summary>
        /// <param name="categoryID"></param>
        /// <returns></returns>
        public List<ProductViewModel> ListByCategoryId(long categoryID, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.CategoryID == categoryID).Count();
            var model = (from a in db.Products
                        join b in db.ProductCategories
                        on a.CategoryID equals b.ID
                        where a.CategoryID == categoryID
                        select new
                        {
                            CateMeteTitle=b.MetaTitle,
                            CateName=b.Name,
                            CreatedDate=a.CreateDate,
                            ID=a.ID,
                            Images=a.Image,
                            Name=a.Name,
                            MetaTitle=a.MetaTitle,
                            Price=a.Price

                        }).AsEnumerable().Select(x => new ProductViewModel()
                        {
                            CateMeteTitle = x.MetaTitle,
                            CateName = x.Name,
                            CreatedDate = x.CreatedDate,
                            ID = x.ID,
                            Images = x.Images,
                            Name = x.Name,
                            MetaTitle = x.MetaTitle,
                            Price = x.Price

                        });
            model.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
           /* return db.Products.Where(x => x.CategoryID == categoryID).ToList();*/

        }


        public List<ProductViewModel> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.Name.Contains(keyword)).Count();
            var model = (from a in db.Products
                        join b in db.ProductCategories
                        on a.CategoryID equals b.ID
                        where a.Name.Contains(keyword)
                        select new
                        {
                            CateMeteTitle = b.MetaTitle,
                            CateName = b.Name,
                            CreatedDate = a.CreateDate,
                            ID = a.ID,
                            Images = a.Image,
                            Name = a.Name,
                            MetaTitle = a.MetaTitle,
                            Price = a.Price

                        }).AsEnumerable().Select(x=>new ProductViewModel()
                        {
                            CateMeteTitle = x.MetaTitle,
                            CateName = x.Name,
                            CreatedDate = x.CreatedDate,
                            ID = x.ID,
                            Images = x.Images,
                            Name = x.Name,
                            MetaTitle = x.MetaTitle,
                            Price = x.Price

                        });
            model.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
            /* return db.Products.Where(x => x.CategoryID == categoryID).ToList();*/

        }
        /// <summary>
        /// List feature product
        /// </summary>
        /// <param name="top"></param>
        /// <returns></returns>
        public List<Product> ListFeatureProduct(int top)
        {
           
            return db.Products.Where(x => x.TopHot != null && x.TopHot > DateTime.Now).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListDQProduct(int top)
        {
            string COD = "A01";
            return db.Products.Where(x => x.Code == COD).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }
        public List<Product> ListRelatedProducts(long productId)
        {
            var product = db.Products.Find(productId);
            return db.Products.Where(x => x.ID != productId && x.CategoryID == product.CategoryID).ToList();
        }
        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }
        public long Insert(Product entity)
        {
            db.Products.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Product entity)
        {
            try
            {
                var product=db.Products.Find(entity.ID);
                product.Name = entity.Name;
                product.MetaTitle = entity.MetaTitle;
                product.Price = entity.Price;
                product.Image=entity.Image;
                product.CreateDate=DateTime.Now;
                product.TopHot = entity.TopHot;
                product.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        
        public bool Delete(int id)
        {
            try
            {
                var product = db.Products.Find(id);
                db.Products.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
