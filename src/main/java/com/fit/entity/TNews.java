package com.fit.entity;

import com.fit.base.BaseEntity;
import java.util.Date;
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
public class TNews extends BaseEntity<TNews> {
    /** 标题 (无默认值) */
    private String title;

    /** 内容 (无默认值) */
    private String content;

    /** 发布者Id(关联用户表) (无默认值) */
    private Long userId;

    /** 发布时间 (无默认值) */
    private Date publishTime;

    /** 访问量  (默认值为: 0) */
    private Integer visits;

    /** 删除状态(默认1 未删除 2 删除)  (默认值为: 1) */
    private Integer state;

    /** 序号 (无默认值) */
    private Integer sort;
}