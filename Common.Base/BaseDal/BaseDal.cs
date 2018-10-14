using Common.Base.BaseEntity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Reflection;
using System.Linq.Expressions;

namespace Common.Base.BaseDal
{
    public abstract class BaseDal<TEntity> : IBaseDal<TEntity> where TEntity : class, IEntityBase
    {
        #region 数据对象指定
        /// <summary>
        /// 实体数据库
        /// </summary>
        protected abstract DbContext ActiveContext { get; }

        /// <summary>
        /// 实体对象集合(查询)
        /// </summary>
        protected virtual DbSet<TEntity> DbQuery
        {
            get { return DbSet; }
        }

        /// <summary>
        /// 实体对象集合(操作)
        /// </summary>
        protected abstract DbSet<TEntity> DbSet { get; }

        #endregion

        #region 插入对象
        /// <summary>
        /// 插入对象
        /// </summary>
        /// <param name="entity"></param>
        public virtual OperateStatus Insert(TEntity entity)
        {
            //操作状态信息
            var status = new OperateStatus();
            try
            {
                //指定状态
                ActiveContext.Entry(entity).State = EntityState.Added;
                //提交数据库
                int k = ActiveContext.SaveChanges();
                //成功
                status.IsSuccessful = true;
            }
            catch (Exception ex)
            {
                //错误信息
                status.Message = ex.Message;
                status.Data = ex;
            }
            return status;
        }
        /// <summary>
        /// 批量新增
        /// </summary>
        /// <param name="entitylist"></param>
        /// <returns></returns>
        public virtual OperateStatus InsertBatchs(IList<TEntity> entitylist)
        {
            //操作状态信息
            var status = new OperateStatus();
            try
            {
                if (entitylist.Count < 1)
                {
                    status.Message = "无添加的数据";
                    return status;
                }
                foreach (var entity in entitylist)
                {
                    //指定状态
                    ActiveContext.Entry(entity).State = EntityState.Added;
                }

                //提交数据库
                int k = ActiveContext.SaveChanges();
                //成功
                status.IsSuccessful = true;
            }
            catch (Exception ex)
            {
                //错误信息
                status.Message = ex.Message;
                status.Data = ex;
            }
            return status;
        }

        #endregion

        #region 修改对象
        /// <summary>
        /// 修改对象
        /// </summary>
        /// <param name="entity"></param>
        public virtual OperateStatus Update(TEntity entity)
        {
            //操作状态信息
            var status = new OperateStatus();
            try
            {
                var entry = ActiveContext.Entry(entity);
                TEntity attachedEntity = DbSet.Find(entity.Id);
                if (attachedEntity != null)
                {
                    var attachedEntry = ActiveContext.Entry(attachedEntity);
                    attachedEntry.CurrentValues.SetValues(entity);
                }
                else
                {
                    entry.State = EntityState.Modified;
                }
                ActiveContext.SaveChanges();

                //成功
                status.IsSuccessful = true;
            }
            catch (Exception ex)
            {
                //错误信息
                status.Message = ex.Message;
                status.Data = ex;
            }
            return status;
        }
        #endregion

        #region 指定字段更新
        /// <summary>
        /// 指定字段更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <param name="fileds">指定字段集合</param>
        public virtual OperateStatus UpdateByEntityFields(TEntity entity, List<string> fileds)
        {
            var status = new OperateStatus();
            if (entity != null && fileds != null)
            {
                try
                {
                    ////附加数据
                    //DbSet.Attach(entity);
                    // //绑定
                    // var SetEntry = ((IObjectContextAdapter)ActiveContext).ObjectContext.ObjectStateManager.GetObjectStateEntry(entity);
                    //foreach (var t in fileds)
                    //{
                    //    //指定具体更新字段
                    //    SetEntry.SetModifiedProperty(t);
                    //}

                    //context.Entry(模型).Property(“隐藏属性“).CurrentValue = DateTime.Now;


                    ActiveContext.SaveChanges();

                    //成功
                    status.IsSuccessful = true;
                }
                catch (Exception ex)
                {
                    //错误信息
                    status.Message = ex.Message;
                    status.Data = ex;
                }
            }
            return status;
        }

        //_userRepository.Update(user,x=>x.Enabled);
        public virtual int Update(TEntity entity, params Expression<Func<TEntity, object>>[] updatedProperties)
        {
            var dbEntityEntry = ActiveContext.Entry(entity);
            if (updatedProperties.Any())  //如果有指定字段,则值更新指定字段
            {
                foreach (var property in updatedProperties)
                {
                    dbEntityEntry.Property(property).IsModified = true;
                }
            }
            else  //否则,检查每一列是否有变化,有变化的才更新
            {
                foreach (var property in dbEntityEntry.OriginalValues.Properties)
                {
                    var propertyName = property.Name;
                    var original = dbEntityEntry.OriginalValues.GetValue<object>(property);
                    var current = dbEntityEntry.CurrentValues.GetValue<object>(property);
                    if (original != null && !original.Equals(current))
                    {
                        dbEntityEntry.Property(propertyName).IsModified = true;
                    }
                }
            }
            return ActiveContext.SaveChanges();
        }
        

        #endregion

        #region 更新除指定字段外的数据
        /// <summary>
        /// 更新除指定字段外的数据
        /// </summary>
        /// <param name="entity">实体</param>
        /// <param name="fileds">指定字段集合</param>
        public virtual OperateStatus UpdateByEntityExceptFields(TEntity entity, List<string> exceptFileds)
        {
            var status = new OperateStatus();
            if (entity != null && exceptFileds != null)
            {
                try
                {
                    ////附加数据
                    //DbSet.Attach(entity);
                    ////绑定
                    //var SetEntry = ((IObjectContextAdapter)ActiveContext).ObjectContext.ObjectStateManager.GetObjectStateEntry(entity);

                    ////实体信息
                    //Type t = entity.GetType();
                    //PropertyInfo[] properties = t.GetProperties();
                    ////变量实体字段
                    //foreach (var filedName in properties)
                    //{
                    //    //排除不更新字段
                    //    if (!exceptFileds.Contains(filedName.Name))
                    //    {
                    //        //指定具体更新字段
                    //        SetEntry.SetModifiedProperty(filedName.Name);
                    //    }
                    //}

                    ActiveContext.SaveChanges();

                    //成功
                    status.IsSuccessful = true;
                }
                catch (Exception ex)
                {
                    //错误信息
                    status.Message = ex.Message;
                    status.Data = ex;
                }
            }
            return status;
        }
        #endregion

        #region 删除对象
        /// <summary>
        /// 删除对象
        /// </summary>
        /// <param name="entity"></param>
        public virtual OperateStatus Delete(TEntity entity)
        {
            //状态信息
            var status = new OperateStatus();
            try
            {
                //设置状态
                ActiveContext.Entry(entity).State = EntityState.Deleted;
                //提交数据库
                ActiveContext.SaveChanges();

                //成功
                status.IsSuccessful = true;
            }
            catch (Exception ex)
            {
                //错误信息
                status.Message = ex.Message;
                status.Data = ex;
            }
            return status;
        }
        #endregion

        #region 根据id删除
        /// <summary>
        /// 根据id删除
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public virtual OperateStatus Delete(Guid Id)
        {
            //状态信息
            var status = new OperateStatus();
            try
            {
                //读取批量删除数据集合
                var entity = DbQuery.FirstOrDefault(p => p.Id == Id);

                if (entity == null)
                {
                    status.Message = "删除的数据不存在";
                    return status;
                }
                ActiveContext.Entry(entity).State = EntityState.Deleted;

                //提交数据库
                ActiveContext.SaveChanges();

                //执行成功
                status.IsSuccessful = true;
                status.Message = "成功";
            }
            catch (Exception ex)
            {
                //错误信息
                status.Message = ex.Message;
            }
            return status;
        }
        #endregion

        #region 根据Id集合批量删除
        /// <summary>
        /// 根据Id集合批量删除
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public virtual OperateStatus DeleteBatchs(IList<Guid> ids)
        {
            //状态信息
            var status = new OperateStatus();
            try
            {
                //读取批量删除数据集合
                var entityList = DbQuery.Where(p => ids.Contains(p.Id));

                if (entityList.Count() < 1)
                {
                    status.Message = "删除的数据不存在";
                    return status;
                }

                foreach (var entity in entityList)
                {
                    //设置状态
                    ActiveContext.Entry(entity).State = EntityState.Deleted;
                }

                //提交数据库
                ActiveContext.SaveChanges();

                //执行成功
                status.IsSuccessful = true;
                status.Message = "成功";
            }
            catch (Exception ex)
            {
                //错误信息
                status.Message = ex.Message;
                status.Data = ex;
            }
            return status;
        }
        #endregion


        #region 根据Id获取实体对象
        /// <summary>
        /// 根据Id获取实体对象
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public virtual TEntity GetById(Guid Id)
        {
            return DbQuery.SingleOrDefault(p => p.Id == Id);
        }
        #endregion

        #region 获取所有对象
        /// <summary>
        /// 获取所有对象
        /// </summary>
        /// <exception cref="NotImplementedException"></exception>
        /// <returns>实体对象清单</returns>
        public virtual IList<TEntity> GetAll()
        {
            IList<TEntity> result = DbQuery.ToList();
            return result;
        }
        #endregion

    }
}
