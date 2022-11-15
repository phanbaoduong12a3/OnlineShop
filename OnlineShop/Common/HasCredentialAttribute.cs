using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Common;
using OnlineShop.Common;

namespace OnlineShop
{
    public class HasCredentialAttribute:AuthorizeAttribute
    {
        public string RoleID { get; set; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[CommonContants.USER_SESSION];
            /*if (session == null)
            {
                return false;
            }*/
            if (session == null)
            {
                httpContext.Response.Redirect("~/Admin/Login");
                return false;
            }
            List<string> privilegelevels = this.GetCredentialByLoggedInUser(session.UserName);
            if (privilegelevels.Contains(this.RoleID)|| session.GroupID==CommonConstants.ADMIN_GROUP)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName="~/Views/Shared/401.cshtml"
            };
        }
        
        private List<string>  GetCredentialByLoggedInUser(string userName)
        {
            var credentials = (List<string>)HttpContext.Current.Session[Common.CommonContants.SESSION_CREDENTIALS];
            return credentials;
        }
    }
}