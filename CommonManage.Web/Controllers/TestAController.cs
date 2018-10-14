using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using CommonManage.Web.Models;
using Common.Base.BaseCommon;
using Microsoft.AspNetCore.Http;

namespace CommonManage.Web.Controllers
{
    public class TestAController : Controller
    {
        public IActionResult Index()
        {
            //GlobalHttpContext.Current.Session.SetString("UserName", "98765");
            //ViewData["Session"] = GlobalHttpContext.Current.Session.GetString("UserName");
            return View();
        }
    }
}
