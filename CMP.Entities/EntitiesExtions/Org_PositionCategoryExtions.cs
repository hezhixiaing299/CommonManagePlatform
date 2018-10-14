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
    public partial class Org_PositionCategory : IEntityBase
    {
    }
    public partial class vOrg_PositionCategory : Org_PositionCategory
    {
    }
    /// <summary>
    /// 扩展查询参数
    /// </summary>
    public class Org_PositionCategoryQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
       /// <summary>
    /// 扩展快速查询参数
    /// </summary>
    public class Org_PositionCategoryQuickQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
}
