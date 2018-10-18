using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;

namespace Common.Base.BaseEntity
{
    public class ClaimsPrincipalUser : ClaimsPrincipal
    {
        public string LoginName { get; set; }
        public bool IsManager { get; set; }
    }
}
