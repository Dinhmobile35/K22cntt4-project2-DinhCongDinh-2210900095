//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dinhkeyshop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reviews
    {
        public int ReviewID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> ProductID { get; set; }
        public Nullable<int> Rating { get; set; }
        public string Comment { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
    
        public virtual Products Products { get; set; }
        public virtual Users Users { get; set; }
    }
}
