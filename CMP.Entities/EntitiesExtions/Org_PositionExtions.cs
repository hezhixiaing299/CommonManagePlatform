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
    public partial class Org_Position : IEntityBase
    {
    }
    public partial class vOrg_Position : Org_Position
    {
    }
    /// <summary>
    /// 扩展查询参数
    /// </summary>
    public class Org_PositionQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
       /// <summary>
    /// 扩展快速查询参数
    /// </summary>
    public class Org_PositionQuickQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
}
