﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LearnWithMentorDAL.Entities
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class LearnWithMentor_DBEntities : DbContext
    {
        public LearnWithMentor_DBEntities()
            : base("name=LearnWithMentor_DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Comments> Comments { get; set; }
        public virtual DbSet<Groups> Groups { get; set; }
        public virtual DbSet<Messages> Messages { get; set; }
        public virtual DbSet<Plans> Plans { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Sections> Sections { get; set; }
        public virtual DbSet<Tasks> Tasks { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UserTasks> UserTasks { get; set; }
        public virtual DbSet<PlanSuggestion> PlanSuggestion { get; set; }
        public virtual DbSet<PlanTasks> PlanTasks { get; set; }
        public virtual DbSet<GROUPS_PLANS_TASKS> GROUPS_PLANS_TASKS { get; set; }
        public virtual DbSet<UERS_ROLES> UERS_ROLES { get; set; }
    
        public virtual int sp_Total_Ammount_of_Users(ObjectParameter total)
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Total_Ammount_of_Users", total);
        }
    }
}
