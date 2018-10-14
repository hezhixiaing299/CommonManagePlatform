using CMP.Dal;
using CMP.Entities;
using Common.Base.BaseBll;
using Common.Base.BaseDal;
using Common.Base.BaseEntity;
using System;
using System.Collections.Generic;

namespace CMP.Bll
{
    public class Org_UserLogic : BaseLogic<Org_User>
    {
        #region 必备

        //数据操作对象
        Org_UserDal Dal = new Org_UserDal();

        private readonly BaseDal<Org_User> repository;

        public Org_UserLogic(Org_UserDal repository)
            : base(repository)
        {
            this.repository = repository;
        }

        public Org_UserLogic()
            : base(new Org_UserDal() { })
        {
        }

        #endregion

        #region 数据操作

        /// <summary>
        /// BLL层重写Create方法(示例)
        /// 默认可以调用base的Create方法
        /// </summary>
        /// <param name="entity">提交数据实体</param>
        /// <returns>返回消息对象</returns>
        public override OperateStatus Create(Org_User entity)
        {
            //var check = Dal.CheckValidate(entity);
            //if (!check.IsSuccessful)
            //{
            //    return check;
            //}
            ////实现逻辑
            //if (entity.Id == Guid.Empty)
            //{
            //    entity.Id = Guid.NewGuid();
            //}
            //创建
            return base.Create(entity);
        }

        /// <summary>
        /// BLL层重写Update方法(示例)
        /// 默认可以调用base的Update方法
        /// </summary>
        /// <param name="entity">提交数据实体</param>
        /// <returns>返回消息对象</returns>
        public override OperateStatus Update(Org_User entity)
        {
            //var check = Dal.CheckValidate(entity);
            //if (!check.IsSuccessful)
            //{
            //    return check;
            //}
            return base.Update(entity);
        }

        /// <summary>
        /// BLL层重写Delete方法(示例)
        /// 默认可以调用base的Delete方法
        /// 单个删除
        /// </summary>
        /// <param name="entity">提交数据实体</param>
        /// <returns>返回消息对象</returns>
        public override OperateStatus Delete(Guid Id)
        {
            return Dal.Delete(Id);
        }

        /// <summary>
        /// BLL层重写DeleteBatchs方法(示例)
        /// 默认可以调用base的DeleteBatchs方法
        /// 批量删除
        /// </summary>
        /// <param name="entity">提交数据实体</param>
        /// <returns>返回消息对象</returns>
        public override OperateStatus DeleteBatchs(IList<Guid> ids)
        {
            return base.DeleteBatchs(ids);
        }

        #endregion

        #region 自定义方法

        /// <summary>
        /// 根据Id获取扩展对象
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public new Org_User GetById(Guid Id)
        {
            return Dal.GetById(Id);
        }

        /// <summary>
        /// 获取所有数据
        /// </summary>
        /// <returns></returns>
        public new IList<Org_User> GetAll()
        {
            return Dal.GetAll();
        }

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="queryParam">自定义扩展查询参数</param>
        /// <returns></returns>
        public ListByPages<vOrg_User> Query(Org_UserQueryParam queryParam)
        {
            return Dal.Query(queryParam);
        }
        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="queryParam">自定义扩展查询参数</param>
        /// <returns></returns>
        public ListByPages<vOrg_User> QuickQuery(Org_UserQuickQueryParam queryParam)
        {
            return Dal.QuickQuery(queryParam);
        }

        #endregion
    }
}
