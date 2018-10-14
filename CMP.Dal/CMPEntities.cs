using System;

namespace CMP.Dal
{
    using System;
    using Microsoft.EntityFrameworkCore;
    using CMP.Entities;
    using Common.Base.BaseEntity;
    using Common.Tool;

    public class CMPEntities : BaseDbContext
    {
        //const,readonly,static综合考虑后
        private static string _connectionString = ConfigurationManager.AppSettings["DBConStrings"]["MainConStrings"].ToString();

        public CMPEntities() : base(new DbContextOptions<DbContext>())
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder modelBuilder)
            => modelBuilder.UseSqlServer(_connectionString);
        //{
        //    modelBuilder.UseSqlServer(_connectionString);
        //    //var connection = @"Data Source=(local);Initial Catalog=GGN_Center;User ID=sa;Password=817178";
        //    //DbContextOptionsBuilder dbb = new DbContextOptionsBuilder();
        //    //var dbBulider = dbb.UseSqlServer(connection).Options;
        //    //base.OnConfiguring(modelBuilder);
        //}

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{
        //    base.OnModelCreating(modelBuilder);
        //}

        public DbSet<Auth_DataObject> Auth_DataObject { get; set; }
        public DbSet<Auth_DataRole> Auth_DataRole { get; set; }
        public DbSet<Auth_DataRoleConfig> Auth_DataRoleConfig { get; set; }
        public DbSet<Auth_DataRoleDirectory> Auth_DataRoleDirectory { get; set; }
        public DbSet<Auth_FeatureRole> Auth_FeatureRole { get; set; }
        public DbSet<Auth_FeatureRoleConfig> Auth_FeatureRoleConfig { get; set; }
        public DbSet<Auth_FeatureRoleDirectory> Auth_FeatureRoleDirectory { get; set; }
        public DbSet<Auth_PositionDataRole> Auth_PositionDataRole { get; set; }
        public DbSet<Auth_PositionFeatureRole> Auth_PositionFeatureRole { get; set; }
        public DbSet<Auth_PositionSpecialMenuConfig> Auth_PositionSpecialMenuConfig { get; set; }
        public DbSet<Org_Group> Org_Group { get; set; }
        public DbSet<Org_Organization> Org_Organization { get; set; }
        public DbSet<Org_OrganizationCategory> Org_OrganizationCategory { get; set; }
        public DbSet<Org_Position> Org_Position { get; set; }
        public DbSet<Org_PositionCategory> Org_PositionCategory { get; set; }
        public DbSet<Org_PositionDefine> Org_PositionDefine { get; set; }
        public DbSet<Org_User> Org_User { get; set; }
        public DbSet<Org_UserPosition> Org_UserPosition { get; set; }
        public DbSet<Sys_Application> Sys_Application { get; set; }
        public DbSet<Sys_ApplicationModule> Sys_ApplicationModule { get; set; }
        public DbSet<Sys_Feature> Sys_Feature { get; set; }
        public DbSet<Sys_Menu> Sys_Menu { get; set; }
        public DbSet<Sys_OpenInterface> Sys_OpenInterface { get; set; }
        public DbSet<Sys_OpenInterfaceType> Sys_OpenInterfaceType { get; set; }
        public DbSet<Sys_Region> Sys_Region { get; set; }
        public DbSet<Sys_StaticData> Sys_StaticData { get; set; }
        public DbSet<Sys_UserLoginHistory> Sys_UserLoginHistory { get; set; }
        public DbSet<Sys_UserLoginState> Sys_UserLoginState { get; set; }
        public DbSet<Sys_UserShortCutMenu> Sys_UserShortCutMenu { get; set; }

        public DbSet<View_DataRolePosition> View_DataRolePosition { get; set; }
        public DbSet<View_FeaturePosition> View_FeaturePosition { get; set; }
        public DbSet<View_MenuSys> View_MenuSys { get; set; }
        public DbSet<View_UserOrgInfo> View_UserOrgInfo { get; set; }
    }
}
