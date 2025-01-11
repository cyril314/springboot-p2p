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
public class TSysRole extends BaseEntity<TSysRole> {
    /** 角色名称 (无默认值) */
    private String name;

    /** 描述 (无默认值) */
    private String refer;
}