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
    public partial class Sys_Menu : IEntityBase
    {
    }
    public partial class vSys_Menu : Sys_Menu
    {
    }
    /// <summary>
    /// 扩展查询参数
    /// </summary>
    public class Sys_MenuQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
       /// <summary>
    /// 扩展快速查询参数
    /// </summary>
    public class Sys_MenuQuickQueryParam : BaseSearchParam
    {
        public string KeyWords { get; set; }
    }
}
