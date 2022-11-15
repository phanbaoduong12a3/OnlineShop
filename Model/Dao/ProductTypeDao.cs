using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Model.Dao
{
    public class ProductTypeDao
    {
        OnlineShopDbContext db = null;
        public ProductTypeDao()
        {
            db = new OnlineShopDbContext();
        }
        public IEnumerable<Product> ListRolexProduct(string searchString, int page,int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 10).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListGucciProduct(string searchString, int page,int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 11).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListOppoProduct(string searchString,int page,int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 18).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListIphoneProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 19).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListSamsungProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 20).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListCaseProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 21).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListPCProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 22).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListDellProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 23).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListAsusProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 24).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListTNGProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 25).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListLGProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 26).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListGTTProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 12).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListGolfProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 13).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListHoodieProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 14).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListQAProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 15).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListDCProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 16).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListLTProduct(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderByDescending(x => x.CreateDate);
            }
            return model.Where(x => x.CategoryID == 17).OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
    }
}
