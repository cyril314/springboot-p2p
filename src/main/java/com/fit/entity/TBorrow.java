package com.fit.entity;

import com.fit.base.BaseEntity;
import java.math.BigDecimal;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @AUTO 借款信息\r\n           
 * @Author AIM
 * @DATE 2025-01-11 04:10:52
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class TBorrow extends BaseEntity<TBorrow> {
    /** 发布人 (无默认值) */
    private Long publisher;

    /** 借款标题 (无默认值) */
    private String borrowTitle;

    /** 借款总额 (无默认值) */
    private BigDecimal borrowAmount;

    /** 借款状态(1 默认等待资料 2 正在招标中 3 已满标 4还款中 5 已还完 6 流标)
              (默认值为: 1) */
    private Integer borrowStatus;

    /** 借款方式(1 净值借款 2 秒还借款 3 普通借款 4 实地考察借款 5 机构担保借款 6 流转标)
             (无默认值) */
    private Integer borrowMethod;

    /** 借款信息 (无默认值) */
    private String borrowInfo;

    /** 借款显示类型(1 一般借款 2 流转标借款)  (默认值为: 1) */
    private Integer borrowShow;

    /** 借款管理费  (默认值为: 0.00) */
    private BigDecimal manageFee;

    /** 借款详情 (无默认值) */
    private String detail;

    /** 借款图片 (无默认值) */
    private String imgPath;

    /** 借款期限 (无默认值) */
    private Integer deadline;

    /** 借款目的 (无默认值) */
    private Integer purpose;

    /** 还款方式(1 按月等额本息还款 2 按先息后本还款)
            
             (无默认值) */
    private Integer paymentMode;

    /** 年利率 (无默认值) */
    private BigDecimal annualRate;

    /** 最低投标金额 (无默认值) */
    private BigDecimal minTenderedSum;

    /** 最多投标金额 (无默认值) */
    private BigDecimal maxTenderedSum;

    /** 筹标期限 (无默认值) */
    private Integer raiseTerm;

    /** 交易类型 (1 线上交易 2 线下交易)  (默认值为: 1) */
    private Integer tradeType;

    /** 浏览量,默认0  (默认值为: 0) */
    private Integer visitors;

    /** 剩余时间开始 (无默认值) */
    private Date remainTimeStart;

    /** 剩余时间结束 (无默认值) */
    private Date remainTimeEnd;

    /** 审核意见 (无默认值) */
    private String auditOpinion;

    /** 奖励类型(1 不设置奖励 2 按固定比例金额分摊 3 按投标金额比例) (无默认值) */
    private Integer excitationType;

    /** 奖励金额 (无默认值) */
    private BigDecimal excitationSum;

    /** 奖励方式（1 成功奖励 ） (无默认值) */
    private Integer excitationMode;

    /** 已投总额，默认0  (默认值为: 0.00) */
    private BigDecimal hasInvestAmount;

    /** 总投标数,默认是0  (默认值为: 0) */
    private Integer investNum;

    /** 是否设置投标密码(-1 默认不设置 1 设置)  (默认值为: -1) */
    private Integer hasPwd;

    /** 投标密码 (无默认值) */
    private String investPwd;

    /** 发布时间 (无默认值) */
    private Date publishTime;

    /** 发布IP (无默认值) */
    private String publishIp;

    /** 满标复审审核通过日期 (无默认值) */
    private Date auditTime;

    /** 已还期数  (默认值为: 0) */
    private Integer hasDeadline;

    /** 自动投标( 默认 1 手动 2 自动)  (默认值为: 1) */
    private Integer isAutobid;

    /** 是否为天标( 默认 1 否，2 是)  (默认值为: 1) */
    private Integer isDayThe;

    /** 允许自动投标时间 (无默认值) */
    private Date autoBidEnableTime;

    /** 版本控制  (默认值为: 0) */
    private Integer version;

    /** 冻结保证金  (默认值为: 0.00) */
    private BigDecimal frozenMargin;

    /** 最小认购单位  (默认值为: 1.00) */
    private BigDecimal smallestFlowUnit;

    /** 总份数（流转标专用）  (默认值为: 0) */
    private Integer circulationNumber;

    /** 已认购份数  (默认值为: 0) */
    private Integer hasCirculationNumber;

    /** 标题种类的唯一标识 (无默认值) */
    private String nidLog;

    /** 排序  (默认值为: 1) */
    private Integer sort;

    /** 费用说明 (无默认值) */
    private String feestate;

    /** 平台收费历史记录 (无默认值) */
    private String feelog;

    /** 商业详情 (无默认值) */
    private String businessDetail;

    /** 资产情况 (无默认值) */
    private String assets;

    /** 资金用途 (无默认值) */
    private String moneyPurposes;

    /** 流转标发布模式(1 前台用户 2 后台特权用户)  (默认值为: 1) */
    private Integer circulationMode;

    /** 流转标审核状态(1 待审核 2 审核成功 3 审核失败)  (默认值为: 1) */
    private Integer circulationStatus;

    /** 代发人 (无默认值) */
    private Long undertaker;

    /** 已回购份数  (默认值为: 0) */
    private Integer hasRepoNumber;

    /** 担保机构 (无默认值) */
    private String agent;

    /** 反担保方式 (无默认值) */
    private String counterAgent;

    /** 借款进度比例 (无默认值) */
    private BigDecimal amountScale;

    /** 环迅标的交易号 (无默认值) */
    private String tradeNo;

    /**  (无默认值) */
    private Integer fabiao;
}