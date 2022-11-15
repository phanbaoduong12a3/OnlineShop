using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    
    public class AboutDao
    {
        OnlineShopDbContext db = null;
        public AboutDao()
        {
            db = new OnlineShopDbContext();
        }
        public About GetByID(long id)
        {
            return db.Abouts.Find(id);
        }
        public IEnumerable<About> ListAllPaging()
        {
            IQueryable<About> model = db.Abouts;

            return model;
        }
        public IEnumerable<About> ListAllAbout(string searching,int page,int pagesize)
        {
            IQueryable<About> model = db.Abouts;
            if (!string.IsNullOrEmpty(searching))
            {
                model = model.Where(x => x.Name.Contains(searching)).OrderByDescending(x => x.CreateDate);
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pagesize);
        }
        public long Insert(About s)
        {
            db.Abouts.Add(s);
            db.SaveChanges();
            return s.ID;
        }
        public About ViewDetail(long id)
        {
            return db.Abouts.Find(id);
        }
        public bool UpdateAbout(About s)
        {
            try
            {
                var about = db.Abouts.Find(s.ID);
                about.Name = s.Name;
                about.Description = s.Description;
                about.CreateDate = s.CreateDate;
                about.Detal = s.Detal;
                about.MetaTitle = s.MetaTitle;
                about.Image = s.Image;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool DeleteAbout(long id)
        {
            try
            {
                var about = db.Abouts.Find(id);
                db.Abouts.Remove(about);
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
