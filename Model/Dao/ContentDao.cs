using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using PagedList;
using System.Web;

namespace Model.Dao
{
    public class ContentDao
    {
        OnlineShopDbContext db = null;
        public static string USER_SESSION = "USER_SESSION";
        public ContentDao()
        {
            db = new OnlineShopDbContext();
        }
        public IEnumerable<Content> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Content> model = db.Contents;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.Name).ToPagedList(page, pageSize);
        }
        //list all content for client
        public IEnumerable<Content> ListAllPaging(int page, int pageSize)
        {
            IQueryable<Content> model = db.Contents;
           
            return model.OrderByDescending(x => x.Name).ToPagedList(page, pageSize);
        }

        //
        public Tag GetTag(string id)
        {
            return db.Tags.Find(id);
        }
        public IEnumerable<Content> ListAllByTag(string tag,int page, int pageSize)
        {
            var model = (from a in db.Contents
                                        join b in db.ContentTags
                                        on a.ID equals b.ContentID
                                        where b.TagID == tag
                                        select new
                                        {
                                            Name = a.Name,
                                            MeteTitle = a.MetaTitle,
                                            Image = a.Image,
                                            Description = a.Description,
                                            CreateDate=a.CreateDate,
                                            CreateBy=a.CreateBy,
                                            ID=a.ID
                                        }).AsEnumerable().Select(x=>new Content()
                                        {
                                            Name = x.Name,
                                            MetaTitle=x.MeteTitle,
                                            Image=x.Image,
                                            Description=x.Description,
                                            CreateDate = x.CreateDate,
                                            CreateBy = x.CreateBy,
                                            ID = x.ID
                                        });

            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public Content GetByID(long id)
        {
            return db.Contents.Find(id);
        }
        public long Create(Content content)
        {
       
            //xu ly alias
            if (string.IsNullOrEmpty(content.MetaTitle))
            {
                content.MetaTitle = StringHelper.ToUnsignString(content.Name);
            }
            content.CreateDate = DateTime.Now;
            content.ViewCount = 0;


            db.Contents.Add(content);
            db.SaveChanges();

            //xu ly tags
            if (!string.IsNullOrEmpty(content.Tags))
            {
                string[] tags = content.Tags.Split(',');
                foreach(var tag in tags)
                {
                    var tagId = StringHelper.ToUnsignString(tag);
                    var existedTag = this.CheckTag(tagId);
                    //insert to to tag table
                    if (!existedTag)
                    {
                        this.InsertTag(tagId, tag);
                    }
                    //insert to content tag
                    this.InsertContentTag(content.ID, tagId);
                }
            }
            

            return content.ID;
        }

        //Edit Content
        public long Edit(Content content)
        {

            //xu ly alias
            if (string.IsNullOrEmpty(content.MetaTitle))
            {
                content.MetaTitle = StringHelper.ToUnsignString(content.Name);
            }
            content.CreateDate = DateTime.Now;
    


            db.SaveChanges();

            //xu ly tags
            if (!string.IsNullOrEmpty(content.Tags))
            {
                this.RemoveAllContentTag(content.ID);
                string[] tags = content.Tags.Split(',');
                foreach (var tag in tags)
                {
                    var tagId = StringHelper.ToUnsignString(tag);
                    var existedTag = this.CheckTag(tagId);
                    //insert to to tag table
                    if (!existedTag)
                    {
                        this.InsertTag(tagId, tag);
                    }
                    //insert to content tag
                    this.InsertContentTag(content.ID, tagId);
                }
            }


            return content.ID;
        }
        public void RemoveAllContentTag(long contentId)
        {
            db.ContentTags.RemoveRange(db.ContentTags.Where(x => x.ContentID == contentId));
            db.SaveChanges();
        }

        public void InsertTag(string id,string name)
        {
            var tag = new Tag();
            tag.ID = id;
            tag.Name = name;
            db.Tags.Add(tag);
            db.SaveChanges();

        }

        public void InsertContentTag(long contentId, string tagId)
        {
            var contentTag= new ContentTag();
            contentTag.ContentID = contentId;
            contentTag.TagID = tagId;
            db.ContentTags.Add(contentTag);
            db.SaveChanges();
        }
        public bool CheckTag(string id)
        {
            return db.Tags.Count(x => x.ID == id)>0;
        }

        public List<Tag> ListTag(long contentId)
        {
            var model = (from a in db.Tags
                         join b in db.ContentTags
                         on a.ID equals b.TagID
                         where b.ContentID == contentId
                         select new
                         {
                             ID = b.TagID,
                             Name = a.Name
                         }).AsEnumerable().Select(x => new Tag()
                         { 
                             ID = x.ID,
                             Name=x.Name
                         });
            
            return model.ToList();
        }
        public bool Update(Content entity)
        {
            try
            {
                var content = db.Contents.Find(entity.ID);
                content.MetaTitle=entity.MetaTitle;
                content.Name = entity.Name;
                content.Description=entity.Description;
                content.Image = entity.Image;
                content.CategoryID = entity.CategoryID;
                content.Detal = entity.Detal;
                content.Warranty = entity.Warranty;
                content.MetaKeywords = entity.MetaKeywords;
                content.MetaDescriptions = entity.MetaDescriptions;
                content.Status = entity.Status;
                content.Tags = entity.Tags;
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
                var content = db.Contents.Find(id);
                db.Contents.Remove(content);
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
