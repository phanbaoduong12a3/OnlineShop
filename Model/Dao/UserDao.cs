using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using Model.EF;
using PagedList;
namespace Model.Dao
{
    public class UserDao
    {
        OnlineShopDbContext db = null;
        public UserDao()
        {
            db= new OnlineShopDbContext();
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public long InsertForFacebook(User entity)
        {
            var user=db.Users.SingleOrDefault(x=>x.UserName==entity.UserName);
            if (user == null)
            {
                db.Users.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }
            else
            {
                return user.ID;
            }
           
        }
        public bool update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);
                user.Name = entity.Name;
                if (!string.IsNullOrEmpty(entity.Password))
                {
                    user.Password = entity.Password;
                }
                user.Email = entity.Email;
                user.Phone = entity.Phone;
                user.Address = entity.Address;
                user.ModifineBy = entity.ModifineBy;
                user.ModifineDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch(Exception )
            {
                return false;
            }
           

        }
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        public User ViewDetail(int id)
        {
            return db.Users.Find(id);
        }
        public List<string > GetListCredential(string userName)
        {
            var user = db.Users.Single(x=> x.UserName == userName);
            var data = (from a in db.Credentials
                        join b in db.UserGroups on a.UserGroupID equals b.ID
                        join c in db.Roles
                       on a.UserGroupID equals c.ID
                        where b.ID == user.GroupID
                        select new 
                        {
                            RoleID = a.RoleID,
                            UserGroupID = a.UserGroupID
                        }).AsEnumerable().Select(x => new Credential()
                        {
                            RoleID = x.RoleID,
                            UserGroupID=x.UserGroupID
                        });
            
            return data.Select(x=>x.RoleID).ToList();
                     
                    
                    
        }
        public int Login(string userName, string passWord, bool isLoginAdmin=false)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName );
            if (result == null)
            {
                return 0;
            }
            else
            {
                
                
                    if(isLoginAdmin==true )
                    {
                        if(result.GroupID == CommonConstants.ADMIN_GROUP || result.GroupID == CommonConstants.MOD_GROUP)
                        {
                            if (result.Status == false)
                            {
                                return -1;
                            }
                            else
                            {
                                if (result.Password == passWord)
                                {
                                    return 1;
                                }
                                else
                                {
                                    return -2;
                                }
                            }
                           
                        }
                        else
                        {
                            return -3;
                        }
                    }
                    else
                    {
                        if (result.Status == false)
                        {
                            return -1;
                        }
                        else
                        {
                            if (result.Password == passWord)
                            {
                                return 1;
                            }
                            else
                            {
                                return -2;
                            }
                        }
                    } 
            }
        }
        public IEnumerable<User> ListAllPaging(string searchString,int page,int pageSize)
        {
            IQueryable<User> model = db.Users;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString)).OrderByDescending(x=>x.CreateDate);
            }
            return model.OrderByDescending(x=>x.CreateDate).ToPagedList(page,pageSize);
        }
       /* public int Login(string userName,string passWord)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName );
            if(result== null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                {
                    return -1;
                }
                else
                {
                    if(result.Password==passWord)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }

            }
        }*/
        public bool ChangeStatus(long id)
        {
            var user = db.Users.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return user.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public bool CheckUserName(string userName)
        {
            return db.Users.Count(x => x.UserName == userName) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
    }
}
