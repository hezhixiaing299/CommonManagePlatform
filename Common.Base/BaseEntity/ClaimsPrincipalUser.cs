using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;

namespace Common.Base.BaseEntity
{
    public class ClaimsPrincipalUser : ClaimsPrincipal
    {
        public Guid Id { get; set; }
        public string LoginName { get; set; }
        public string UserCode { get; set; }
        public string UserName { get; set; }
        public bool IsOutSide { get; set; }
        public string Phone { get; set; }
        public bool IsManager { get; set; }
    }
}
