using Common.Base.BaseEntity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace CommonManage.Web.Controllers
{
    public class BaseController : Controller
    {
        protected virtual ClaimsPrincipalUser CurrentUser { get; set; }

        #region Override Event

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            ValidateUserFeatureAuthority(context, CurrentUser);
            base.OnActionExecuting(context);
        }

        public override void OnActionExecuted(ActionExecutedContext context)
        {
            base.OnActionExecuted(context);
        }

        #endregion
        
        #region cookie 操作
        /// <summary>
        /// 设置本地cookie
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>  
        /// <param name="minutes">过期时长，单位：分钟</param>      
        protected void SetCookies(string key, string value, int minutes = 30)
        {
            HttpContext.Response.Cookies.Append(key, value, new CookieOptions
            {
                Expires = DateTime.Now.AddMinutes(minutes),
                IsEssential = false
            });
        }

        /// <summary>
        /// 删除指定的cookie
        /// </summary>
        /// <param name="key">键</param>
        protected void DeleteCookies(string key)
        {
            HttpContext.Response.Cookies.Delete(key);
        }

        /// <summary>
        /// 获取cookies
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>返回对应的值</returns>
        protected string GetCookies(string key)
        {
            HttpContext.Request.Cookies.TryGetValue(key, out string value);
            if (string.IsNullOrEmpty(value))
                value = string.Empty;
            return value;
        }
        #endregion

        #region 验证用户功能权限

        /// <summary>
        /// 验证用户功能权限
        /// 先对用户的登录状态进行验证，如果未登录则重定向到系统配置中配置的登录页面，并且终止当前请求Action的执行。
        /// 如果已登录，则继续进行功能项权限验证，如果用户没有所请求Action的权限则重定向到权限验证失败页面，并且终止当前请求Action的执行。
        /// 如果权限验证通过则继续执行所请求的Action
        /// </summary>
        public static bool ValidateUserFeatureAuthority(ActionExecutingContext actionExecutingContext, ClaimsPrincipalUser currentUser)
        {
            IgnoreAuthorityAttribute authorityAttribute = GetIgnoreAuthorityAttribute(actionExecutingContext);
            if (authorityAttribute != null && authorityAttribute.IgnoreType == IgnoreType.IgnoreLogin) //是否有验证特性
            {
                return true;
            }
            if (currentUser == null)
            {
                //页面跳转
                return false;
            }
            if (currentUser.IsManager)  //管理员
            {
                return true;
            }
            string logonName = currentUser.LoginName;
            //WriteUserTokenCookie(logonName);
            string controllerName = ((ControllerActionDescriptor)actionExecutingContext.ActionDescriptor).ControllerName;
            string actionName = ((ControllerActionDescriptor)actionExecutingContext.ActionDescriptor).ActionName;
            if (authorityAttribute != null)
            {
                if (authorityAttribute.IgnoreType == IgnoreType.IgnoreFeature)
                {
                    return true;
                }
                if (authorityAttribute.IgnoreType == IgnoreType.SameAs)
                {
                    if (string.IsNullOrEmpty(authorityAttribute.SameActionName))  //如果没有复制SameActionName,则用当前ActionName
                    {
                        authorityAttribute.SameActionName = actionName;
                    }
                    actionName = authorityAttribute.SameActionName;
                    if (string.IsNullOrEmpty(authorityAttribute.SameControllerName))
                    {
                        controllerName = authorityAttribute.SameControllerName;
                    }
                    //var userinfo = (UserBackFullInfo)(actionExecutingContext.HttpContext.Session[currentUser.LoginName]);
                    //var FeatureCheck = userinfo.UserFeatureInfoList.Where(p => p.FeatureControllerName == controllerName && p.FeatureActionName == actionName).ToList();
                    //if (FeatureCheck.Count == 1)
                    //{
                    //    return true;
                    //}
                    //else
                    //{
                    //    throw new InvalidOperationException(string.Format("Controller：{0}上的Action：{1}配置异常,请检查配置!", (object)controllerName, (object)actionName));
                    //}
                }
            }
            return true;
        }
        
        /// <summary>
        /// 指定的Action是否需要权限检查
        /// </summary>
        /// <param name="actionExecutingContext"/>
        /// <returns/>
        private static IgnoreAuthorityAttribute GetIgnoreAuthorityAttribute(ActionExecutingContext actionExecutingContext)
        {
            object[] customAttributes = ((ControllerActionDescriptor)actionExecutingContext.ActionDescriptor).MethodInfo.GetCustomAttributes(typeof(IgnoreAuthorityAttribute), false);
            if (customAttributes.Length != 0)
            {
                return (IgnoreAuthorityAttribute)customAttributes[0];
            }
            return (IgnoreAuthorityAttribute)null;
        }

        #endregion
    }
}
