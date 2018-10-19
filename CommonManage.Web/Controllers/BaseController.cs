using CMP.Entities;
using Common.Base.BaseCommon;
using Common.Base.BaseEntity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace CommonManage.Web.Controllers
{
    public class BaseController : Controller
    {
        protected virtual ClaimsPrincipalUser CurrentUser { get; set; }

        /// <summary>
        /// 用户令牌CookieKey,写死定义叫"xxxxxTokenCookie"
        /// </summary>
        private static readonly string userCMPTokenCookie = "CMPTokenCookie";

        #region Override Event

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //整体权限检查/缓存用户数据/记录日志/异常返回信息定义(和前台约定页面跳转)
            if (this.CurrentUser == null)
            {
                //为空处理. 比如记录日志,跳转登录页等等
                //这个要和前台约定返回数据
            }
            else
            {
                //开始检查权限这些
                ValidateUserFeatureAuthority(context, CurrentUser);
                base.OnActionExecuting(context);
            }            
        }

        public override void OnActionExecuted(ActionExecutedContext context)
        {
            base.OnActionExecuted(context);
        }

        #endregion


        //private void Initialize()
        //{
        //    this.CurrentUser = UserHelper.GetCurrentUser();

        //    //核对用户信息和安全信息 / 登录是否有效 / 缓存用户数据 / 记录日志 / 异常返回信息定义(和前台约定页面跳转)
        //    if (CurrentUser != null)
        //    {
        //        requestContext.HttpContext.User = (IPrincipal)this.CurrentUser;
        //        this.CurrentUserFullInfo = (UserBackFullInfo)(requestContext.HttpContext.Session[this.CurrentUser.LoginName]);
        //        //把组织机构全部数据放入缓存,如果取不到值(没有设置或者过期)
        //        var orgdata = RedisHelper.Get<List<Org_Organization>>("GGNCenterOrgs");
        //        if (orgdata == null || orgdata.Count == 0)
        //        {
        //            Org_OrganizationDal oobll = new Org_OrganizationDal();
        //            var orgall = oobll.GetAll().ToList();
        //            RedisHelper.Set("GGNCenterOrgs", orgall, new TimeSpan(3650, 0, 0, 0, 0)); //失效时间3650天,10年
        //        }
        //        //把全部员工数据放入缓存,如果取不到值(没有设置或者过期)
        //        var allorguserdata = RedisHelper.Get<List<View_UserOrgInfo>>("GGNCenterOrgAllPersons");
        //        if (allorguserdata == null || allorguserdata.Count == 0)
        //        {
        //            Org_UserDal orguserbll = new Org_UserDal();
        //            var orguserall = orguserbll.GetAllUserInfos();
        //            RedisHelper.Set("GGNCenterOrgAllPersons", orguserall, new TimeSpan(3650, 0, 0, 0, 0)); //失效时间3650天,10年
        //        }
        //    }
        //}
    }
}
