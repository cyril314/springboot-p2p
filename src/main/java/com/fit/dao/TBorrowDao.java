package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.TBorrow;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 借款信息\r\n           接口
 * @Author AIM
 * @DATE 2025-01-10 19:48:38
 */
@Mapper
public interface TBorrowDao extends BaseCrudDao<TBorrow> {
}