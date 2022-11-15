using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
namespace OnlineShop.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Hãy nhập UserName")]
        public string UserName { get; set; }  

        [Required(ErrorMessage = "Hãy nhập Password")]
        public string Password { get; set; }
        
        public bool RememberMe { get; set; }
    }
}