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
public class TSeoconfig extends BaseEntity<TSeoconfig> {
    /**  (无默认值) */
    private String title;

    /**  (无默认值) */
    private String keywords;

    /**  (无默认值) */
    private String description;

    /**  (无默认值) */
    private String otherTags;

    /**   (默认值为: 0) */
    private Integer siteMap;
}