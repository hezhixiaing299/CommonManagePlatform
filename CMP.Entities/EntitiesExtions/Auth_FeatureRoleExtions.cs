using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Base.BaseEntity;

namespace CMP.Entities
{
    /// <summary>
    /// 扩展属性
    /// </summary>
    public partial class Auth_FeatureRole : IEntityBase
    {
    }
    public partial class vAuth_FeatureRole : Auth_FeatureRole
    {
    }
    /// <summary>
    /// 扩展查询参数
    /// </summary>
    public class Auth_FeatureRoleQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
       /// <summary>
    /// 扩展快速查询参数
    /// </summary>
    public class Auth_FeatureRoleQuickQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
}
