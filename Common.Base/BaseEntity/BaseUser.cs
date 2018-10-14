using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace Common.Base.BaseEntity
{
    public class BaseUser
    {
        /// <summary>
        /// 
        /// </summary>
        public Guid Id { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LoginName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string PassWord { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public bool Sex { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Phone { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string IP { get; set; }
        /// <summary>
        /// 设备
        /// </summary>
        public string EquipmentMark { get; set; }
        public string SessionId { get; set; }
        public string TokenKey { get; set; }
        public string TokenValue { get; set; }
    }

    /// <summary>
    /// 在上下文中使用的用户
    /// </summary>
    public class PrincipalUser : ClaimsPrincipal
    {
        public PrincipalUser()
        {
        }

        // <summary>
        /// 获取当前用户
        /// </summary>
        /// <returns></returns>
        public new static PrincipalUser Current
        {
            get
            {
                PrincipalUser principalUser = GetWebAppUserInfo();
                return principalUser;
            }
        }

        /// <summary>
        /// 获取WEB应用的用户信息
        /// </summary>
        /// <returns></returns>
        private static PrincipalUser GetWebAppUserInfo()
        {
            return ClaimsPrincipal.Current as PrincipalUser;
        }

        #region 用户信息

        /// <summary>
        /// Id
        /// </summary>
        public Guid Id { get; set; }

        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 用户姓名
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 用户电话
        /// </summary>
        public string Phone { get; set; }

        public string UserCode { get; set; }

        public bool IsManager { get; set; }

        /// <summary>
        /// 是否内部员工
        /// </summary>
        public bool IsOutSide { get; set; }

        /// <summary>
        /// 用户当前组织机构id(关系)
        /// </summary>
        public Guid CurrentOrgId { get; set; }

        /// <summary>
        /// 设备标示
        /// </summary>
        public string EquipmentMark { get; set; }

        #endregion
    }
}
