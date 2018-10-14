using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using CommonManage.Web.Models;
using Common.Base.BaseCommon;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore;
using Common.Tool;
using CMP.Dal;
using Common.Base.BaseEntity;

namespace CommonManage.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            //HttpContext.Response.Cookies.Append("aaaa","1111");
            ViewData["Session"] = TestSession();
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public void TestRedis()
        {
            //var orgdata = RedisHelper.Get<List<Org_Organization>>("GGNCenterOrgs");
            //var allorguserdata = RedisHelper.Get<List<View_UserOrgInfo>>("GGNCenterOrgAllPersons");
            //var GGNCenterUser_sysadmin = RedisHelper.Get("GGNCenterUser_sysadmin");
            //var aa = RedisHelper.Get<UserBackFullInfo>("GGNCenterUser_sysadmin");
            //var bb = RedisHelper.Get("GGNCenterOrgAllPersons");
            //HttpContext.Session.SetString("Login_VerifyCode","123456");
            //var bb = HttpContext.Session.GetString("Login_VerifyCode");
        }

        public void ConfigurationManager()
        {
            //var a  = ConfigurationManager.AppSettings["DBConStrings"]["MainConStrings"];
        }

        public void TestDBConnection()
        {
            //int LoginStateTime = int.Parse(GlobalStaticParam.GetByCode("LoginStateTime").ToString());
            //Org_UserDal ouDal = new Org_UserDal();
            //ouDal.CheckLogin(new BaseUser { LoginName = "sysadmin" });
        }

        public string TestSession()
        {
            var aa = GlobalHttpContext.Current.Session.GetString("UserName");
            return aa;
        }
    }
}
