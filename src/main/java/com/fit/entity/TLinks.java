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
public class TLinks extends BaseEntity<TLinks> {
    /** 序号 (无默认值) */
    private Long serialCount;

    /** 公司名称 (无默认值) */
    private String companyName;

    /** 图片 (无默认值) */
    private String companyImg;

    /** 网站地址 (无默认值) */
    private String companyUrl;

    /** 发布时间 (无默认值) */
    private Date publishTime;

    /** 类型（1：友情链接 2:投资广告 3: 首页图片 默认1）  (默认值为: 1) */
    private Long type;

    /** 排序（可以根据字段来控制广告图片的前后排序 默认值为1）  (默认值为: 1) */
    private Long ordershort;

    /** 文本 (无默认值) */
    private String content;
}