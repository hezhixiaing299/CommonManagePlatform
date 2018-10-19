using CMP.Dal;
using CMP.Entities;
using Common.Base.BaseCommon;
using Common.Base.BaseEntity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace CommonManage.Web
{
    public static class UserHelper
    {        
        public static ClaimsPrincipalUser CurrentUser { get; set; }

        /// <summary>
        /// 用户令牌CookieKey,写死定义叫"xxxxxTokenCookie"
        /// </summary>
        private static readonly string userCMPTokenCookie = "CMPTokenCookie";


        private static readonly Org_UserDal dalUser = new Org_UserDal();

        #region 用户操作

        /// <summary>
        /// 获取当前用户
        /// </summary>
        /// <returns></returns>
        public static ClaimsPrincipalUser GetCurrentUser()
        {
            ClaimsPrincipalUser principalUser;

            //取得 cookieValue
            string cookieValue = GetCookies(userCMPTokenCookie);
            //通过Cookie获取当前登陆名,如果没有,则需要登录
            if (string.IsNullOrEmpty(cookieValue))
            {
                return null;
            }
            string loginName = DecryptLoginName(cookieValue);

            if (string.IsNullOrEmpty(loginName))
            {
                principalUser = null;
                GlobalHttpContext.Current.Session.Set<UserBackFullInfo>(loginName,null);                
                if (!string.IsNullOrEmpty(cookieValue))  //删除cookie
                {
                    DeleteCookies(userCMPTokenCookie);
                }
            }
            else
            {
                //Session里面不存在
                if (GlobalHttpContext.Current.Session.Get(loginName) == null)
                {
                    //检查数据库是否有此用户
                    Org_User user = GetOnlineUser(loginName);
                    if (user == null) //没有说明有问题
                    {
                        principalUser = (ClaimsPrincipalUser)null;
                        if (!string.IsNullOrEmpty(cookieValue))  //删除cookie
                        {
                            DeleteCookies(userCMPTokenCookie);
                        }
                    }
                    else
                    {
                        //如果有此用户
                        principalUser = new ClaimsPrincipalUser
                        {
                            Id = user.Id,
                            LoginName = user.LoginName,
                            UserName = user.UserName,
                            UserCode = user.Code,
                            IsManager = false,
                            IsOutSide = user.IsOutSide,
                            Phone = user.Phone
                        };
                        //获取用户全信息数据
                        Org_UserQueryParam query = new Org_UserQueryParam { LoginName = loginName };
                        var userdatainfo = dalUser.GetUserFullInfo(query);

                        //重建此session和缓存数据
                        principalUser.IsManager = userdatainfo.BaseInfo.IsSuperMgr;

                        RedisHelper.Set("GGNCenterUser_" + loginName, userdatainfo, null);
                        GlobalHttpContext.Current.Session.Set(principalUser.LoginName, userdatainfo);
                    }
                }
                else //Session里面存在
                {
                    var sessionUser = GlobalHttpContext.Current.Session.Get<UserBackFullInfo>(loginName);
                    principalUser = new ClaimsPrincipalUser();
                    principalUser.Id = sessionUser.BaseInfo.Id;
                    principalUser.LoginName = sessionUser.BaseInfo.LoginName;
                    principalUser.UserName = sessionUser.BaseInfo.UserName;
                    principalUser.UserCode = sessionUser.BaseInfo.Code;
                    principalUser.IsManager = sessionUser.BaseInfo.IsSuperMgr;
                    principalUser.IsOutSide = sessionUser.BaseInfo.IsOutSide;
                    principalUser.Phone = sessionUser.BaseInfo.Phone;
                }
            }
            return principalUser;
        }

        #endregion


        #region Token/Cookie + 加密/解密 操作

        /// <summary>
        /// 设置本地cookie
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>  
        /// <param name="minutes">过期时长，单位：分钟</param>      
        public static void SetCookies(string key, string value, int minutes = 30)
        {
            //HttpContext.Response.Cookies.Append(key, value, new CookieOptions
            //{
            //    Expires = DateTime.Now.AddMinutes(minutes),
            //    IsEssential = false
            //});
            GlobalHttpContext.Current.Response.Cookies.Append(key, value, new CookieOptions
            {
                Expires = DateTime.Now.AddMinutes(minutes),
                IsEssential = false
            });
        }

        /// <summary>
        /// 删除指定的cookie
        /// </summary>
        /// <param name="key">键</param>
        public static void DeleteCookies(string key)
        {
            //HttpContext.Response.Cookies.Delete(key);
            GlobalHttpContext.Current.Response.Cookies.Delete(key);
        }

        /// <summary>
        /// 获取cookies
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>返回对应的值</returns>
        public static string GetCookies(string key)
        {
            //HttpContext.Request.Cookies.TryGetValue(key, out string value);
            //if (string.IsNullOrEmpty(value))
            //{
            //    value = string.Empty;
            //}
            //return value;
            GlobalHttpContext.Current.Request.Cookies.TryGetValue(key, out string value);
            if (string.IsNullOrEmpty(value))
            {
                value = string.Empty;
            }
            return value;
        }

        /// <summary>
        /// 写入用户令牌Cookie
        /// </summary>
        public static void WriteUserTokenCookie(string loginName)
        {
            string securityKey = GetSecurityKey();
            int loginExpiresTime = Convert.ToInt32(GlobalStaticParam.GetByCode("LoginStateTime"));
            DateTime expirationTime = DateTime.Now.AddHours(loginExpiresTime);
            //创建用户令牌Cookie值
            string value = CreateUserTokenCookieValue(loginName, securityKey, expirationTime);

            //设置域,默认没有
            var domianCookieOptions = new CookieOptions { Expires = expirationTime, IsEssential = false };
            SetCookieDomain(domianCookieOptions);

            //添加cookie
            GlobalHttpContext.Current.Response.Cookies.Append(userCMPTokenCookie, value, domianCookieOptions);
        }

        /// <summary>
        /// 获取加密key
        /// </summary>
        /// <returns></returns>
        private static string GetSecurityKey()
        {
            //todo 从系统配置中获取加密key,但机制没确定,暂时静态表中不加这个code
            return "";
        }

        /// <summary>
        /// 创建用户令牌Cookie值
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="securityKey"></param>
        /// <param name="expirationTime"></param>
        /// <returns></returns>
        public static string CreateUserTokenCookieValue(string loginName, string securityKey, DateTime expirationTime)
        {
            //加密过程：
            //1.构造加密前格式：登录名(loginName)+密钥(securityKey)+到期时间(expirationTime,yyyyMMddHHmmss)
            //2.用MD5Hash
            //3.构造编码格式：hash值（32位）+到期时间（endTime,yyyyMMddHHmmss，14位）+登录名
            //4.用Base64编码
            string expirationTimeString = expirationTime.ToString("yyyyMMddHHmmss");
            string md5Key = string.Format("{0}{1}{2}", loginName, securityKey, expirationTimeString);
            string md5Result = GetMd5Hash(md5Key);
            //Console.WriteLine("MD5 Result is:"+ md5Result);
            string encodeKey = string.Format("{0}{1}{2}", md5Result, expirationTimeString, loginName);
            return EncodeToBase64(encodeKey);
        }

        /// <summary>
        /// 获取Md5哈希值
        /// </summary>
        /// <param name="value">返回值为32位的字符串</param>
        /// <returns></returns>
        private static string GetMd5Hash(string value)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(value);
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(bytes);

            //md5以后为16字节的数组，128位，将其按16进制编码后，转换为32位的字符串
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                stringBuilder.Append(data[i].ToString("x2"));
            }
            return stringBuilder.ToString();
        }

        /// <summary>
        /// 获取按Base64编码后的字符串
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static string EncodeToBase64(string value)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(value);
            return Convert.ToBase64String(bytes);
        }

        /// <summary>
        /// 设置域
        /// </summary>
        /// <param name="cookie"></param>
        private static void SetCookieDomain(CookieOptions cookie)
        {
            if (GlobalHttpContext.Current == null || GlobalHttpContext.Current.Request.Host.Host == "localhost")
            {
                return;
            }
            else
            {
                cookie.Domain = (string)GlobalStaticParam.GetByCode("Domain");
            }
        }

        /// <summary>
        /// 解密Cookie获取用户名
        /// </summary>
        /// <returns></returns>
        public static string DecryptLoginName(string userToken)
        {
            //cookie长度为76位
            if (string.IsNullOrEmpty(userToken))
            {
                return null;
            }
            //解码Base64编码
            string decodeString = DecodeFromBase64(userToken);
            //验证过期时间是否有效
            string expirationTimeString = decodeString.Substring(32, 14);
            if (!IsExpirationTimeValid(expirationTimeString))
                return null;
            //验证登录名是否有效
            if (!IsLoginNameValid(decodeString))
                return null;
            string loginName = decodeString.Substring(46);
            return loginName;
        }

        /// <summary>
        /// 获取解码Base64后的格式
        /// </summary>
        /// <returns></returns>
        private static string DecodeFromBase64(string value)
        {
            byte[] bytes = Convert.FromBase64String(value);
            return Encoding.UTF8.GetString(bytes);
        }

        /// <summary>
        /// 检测过期时间是否有效
        /// </summary>
        /// <param name="expirationTimeString"></param>
        /// <returns></returns>
        private static bool IsExpirationTimeValid(string expirationTimeString)
        {
            DateTime expirationTime = GetDateTimeFromString(expirationTimeString);
            return expirationTime > DateTime.Now;
        }

        private static DateTime GetDateTimeFromString(string timeString)
        {
            int year = int.Parse(timeString.Substring(0, 4));
            int month = int.Parse(timeString.Substring(4, 2));
            int day = int.Parse(timeString.Substring(6, 2));
            int hour = int.Parse(timeString.Substring(8, 2));
            int minute = int.Parse(timeString.Substring(10, 2));
            int second = int.Parse(timeString.Substring(12, 2));
            DateTime result = new DateTime(year, month, day, hour, minute, second);
            return result;
        }

        /// <summary>
        /// 检测登录名是否有效
        /// </summary>
        /// <param name="decodeString"></param>
        /// <returns></returns>
        private static bool IsLoginNameValid(string decodeString)
        {
            string md5Result = decodeString.Substring(0, 32);
            string expirationTimeString = decodeString.Substring(32, 14);
            string loginName = decodeString.Substring(46);
            string md5Key = string.Format("{0}{1}{2}", loginName, GetSecurityKey(), expirationTimeString);
            return md5Result == GetMd5Hash(md5Key);
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
            string loginName = currentUser.LoginName;
            WriteUserTokenCookie(loginName);
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
                    var userinfo = actionExecutingContext.HttpContext.Session.Get<UserBackFullInfo>(currentUser.LoginName);
                    var FeatureCheck = userinfo.UserFeatureInfoList.Where(p => p.FeatureControllerName == controllerName && p.FeatureActionName == actionName).ToList();
                    if (FeatureCheck.Count == 1)
                    {
                        return true;
                    }
                    else
                    {
                        throw new InvalidOperationException(string.Format("Controller：{0}上的Action：{1}配置异常,请检查配置!", (object)controllerName, (object)actionName));
                    }
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