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
    public partial class Sys_Feature : IEntityBase
    {
    }
    public partial class vSys_Feature : Sys_Feature
    {
    }
    /// <summary>
    /// 扩展查询参数
    /// </summary>
    public class Sys_FeatureQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
       /// <summary>
    /// 扩展快速查询参数
    /// </summary>
    public class Sys_FeatureQuickQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
}
