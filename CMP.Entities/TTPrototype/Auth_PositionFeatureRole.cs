//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------
using System.Runtime.Serialization;
using System.ComponentModel;
using System;
using System.Collections.Generic;


namespace CMP.Entities
{
    /// <summary>
    /// 
    /// </summary> 
    [DataContract(IsReference = true)]
    [Description("")]
    public partial class Auth_PositionFeatureRole
    {
    	[DataMember]
    	[Description("")]
        /// <summary>
    	/// 
    	/// </summary>
    	public System.Guid Id { get; set; }
    
    	[DataMember]
    	[Description("")]
        /// <summary>
    	/// 
    	/// </summary>
    	public System.Guid PositionId { get; set; }
    
    	[DataMember]
    	[Description("")]
        /// <summary>
    	/// 
    	/// </summary>
    	public System.Guid FeatureRoleId { get; set; }
    
    	[DataMember]
    	[Description("")]
        /// <summary>
    	/// 
    	/// </summary>
    	public int Sort { get; set; }
    
    }
}
