using Common.Base.BaseEntity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Base.BaseDal
{
    public interface IBaseDal<TEntity> where TEntity : class, IEntityBase
    {
        OperateStatus Insert(TEntity entity);
    }
}
