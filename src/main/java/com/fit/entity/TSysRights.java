package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @AUTO 
 * @Author AIM
 * @DATE 2025-01-11 04:10:52
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class TSysRights extends BaseEntity<TSysRights> {
    /** 父编号 (无默认值) */
    private Long parentId;

    /**  (无默认值) */
    private String name;

    /**  (无默认值) */
    private String action;

    /** 是否记录日志: 1-是,2-否  (默认值为: 1) */
    private Integer isLog;

    /** 是否权限拦截: 1-是,2-否  (默认值为: 1) */
    private Integer isintercept;

    /** 是否是查询 (无默认值) */
    private Integer isQuery;

    /** 排序 (无默认值) */
    private Integer sort;

    /** 描述 (无默认值) */
    private String refer;
}