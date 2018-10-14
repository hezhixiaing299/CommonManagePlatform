using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Base.BaseEntity
{
    public class BaseDbContext : DbContext
    {
        public BaseDbContext(DbContextOptions<DbContext> dbo) : base(dbo)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder modelBuilder)
        {
            //var connection = @"Data Source=(local);Initial Catalog=GGN_Center;User ID=sa;Password=817178";
            //DbContextOptionsBuilder dbb = new DbContextOptionsBuilder();
            //var dbBulider = dbb.UseSqlServer(connection).Options;
            base.OnConfiguring(modelBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {            
        }


        public override int SaveChanges()
        {
            var returnId = base.SaveChanges(true);  //返回普通的上下文SaveChanges方法
            return returnId;
        }

        public override int SaveChanges(bool acceptAllChangesOnSuccess)
        {
            var returnId = base.SaveChanges(acceptAllChangesOnSuccess);  //返回普通的上下文SaveChanges方法
            return returnId;
        }

        public int SaveChangesBulk()
        {
            var returnId = base.SaveChanges();  //返回普通的上下文SaveChanges方法
            return returnId;
        }



    }
}
