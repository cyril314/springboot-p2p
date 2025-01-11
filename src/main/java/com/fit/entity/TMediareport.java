package com.fit.entity;

import com.fit.base.BaseEntity;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @AUTO 媒体报道
 * @Author AIM
 * @DATE 2025-01-11 04:10:52
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class TMediareport extends BaseEntity<TMediareport> {
    /** 序号 (无默认值) */
    private Integer sort;

    /** 标题 (无默认值) */
    private String title;

    /** 来源 (无默认值) */
    private String source;

    /** 网址 (无默认值) */
    private String url;

    /** 图片路径 (无默认值) */
    private String imgPath;

    /** 新闻简述 (无默认值) */
    private String content;

    /** 新闻发布时间 (无默认值) */
    private Date publishTime;

    /** 新闻状态  (默认值为: 1) */
    private Integer state;

    /** 是否置顶  ( 1.默认   2.置顶 )  (默认值为: 1) */
    private Integer stick;
}