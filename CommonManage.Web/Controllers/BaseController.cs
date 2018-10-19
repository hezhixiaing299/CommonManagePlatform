using CMP.Dal;
using CMP.Entities;
using Common.Base.BaseCommon;
using Common.Base.BaseEntity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CommonManage.Web.Controllers
{
    public class BaseController : Controller
    {
        protected virtual ClaimsPrincipalUser CurrentUser { get; set; }

        protected virtual UserBackFullInfo CurrentUserFullInfo { get; private set; }

        #region Override Event

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //整体权限检查/缓存用户数据/记录日志/异常返回信息定义(和前台约定页面跳转)
            if (this.CurrentUser == null)
            {
                //为空处理. 比如记录日志,跳转登录页等等
                //这个要和前台约定返回数据
                throw new Exception("没有用户信息!");
            }
            else
            {
                //初始信息处理
                Initialize();
                //开始检查权限这些
                UserHelper.ValidateUserFeatureAuthority(context, CurrentUser);
                base.OnActionExecuting(context);
            }
        }

        public override void OnActionExecuted(ActionExecutedContext context)
        {
            base.OnActionExecuted(context);
        }

        #endregion

        private void Initialize()
        {
            this.CurrentUser = UserHelper.GetCurrentUser();

            //核对用户信息和安全信息 / 登录是否有效 / 缓存用户数据 / 记录日志 / 异常返回信息定义(和前台约定页面跳转)
            if (CurrentUser != null)
            {
                GlobalHttpContext.Current.User = this.CurrentUser;
                this.CurrentUserFullInfo = GlobalHttpContext.Current.Session.Get<UserBackFullInfo>(this.CurrentUser.LoginName);
                //把组织机构全部数据放入缓存,如果取不到值(没有设置或者过期)
                var orgdata = RedisHelper.Get<List<Org_Organization>>("CMPOrgs");
                if (orgdata == null || orgdata.Count == 0)
                {
                    Org_OrganizationDal oobll = new Org_OrganizationDal();
                    var orgall = oobll.GetAll().ToList();
                    RedisHelper.Set("CMPOrgs", orgall, new TimeSpan(3650, 0, 0, 0, 0)); //失效时间3650天,10年
                }
                //把全部员工数据放入缓存,如果取不到值(没有设置或者过期)
                var allorguserdata = RedisHelper.Get<List<View_UserOrgInfo>>("CMPOrgAllPersons");
                if (allorguserdata == null || allorguserdata.Count == 0)
                {
                    Org_UserDal orguserbll = new Org_UserDal();
                    var orguserall = orguserbll.GetAllUserInfos();
                    RedisHelper.Set("CMPOrgAllPersons", orguserall, new TimeSpan(3650, 0, 0, 0, 0)); //失效时间3650天,10年
                }
            }
        }
    }
}
