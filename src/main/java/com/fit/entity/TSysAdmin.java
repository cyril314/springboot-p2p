package com.fit.entity;

import com.fit.base.BaseEntity;
import java.math.BigDecimal;
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
public class TSysAdmin extends BaseEntity<TSysAdmin> {
    /** 用户名 (无默认值) */
    private String userName;

    /** 密码 (无默认值) */
    private String password;

    /** 角色ID (无默认值) */
    private Long roleId;

    /** 状态: 1-启用,2-禁用  (默认值为: 1) */
    private Integer enable;

    /** 是否为组长:0-否,1-是)  (默认值为: 0) */
    private Integer isLeader;

    /** 真实姓名 (无默认值) */
    private String realName;

    /** 最后一次登录时间 (无默认值) */
    private Date lastDate;

    /** 最后一次登录IP (无默认值) */
    private String lastIp;

    /**  (无默认值) */
    private String img;

    /** 手机号 (无默认值) */
    private String telephone;

    /** 联系地址 (无默认值) */
    private String address;

    /** 身份证号 (无默认值) */
    private String card;

    /** 邮箱 (无默认值) */
    private String email;

    /** 性别:0-女,1-男 (无默认值) */
    private Integer sex;

    /**  (无默认值) */
    private String qq;

    /** 籍贯省编号（默认为-1）  (默认值为: -1) */
    private Integer nativePlacePro;

    /** 籍贯城市编号（默认为-1）  (默认值为: -1) */
    private Integer nativePlaceCity;

    /** 奖励提成  (默认值为: 0.00) */
    private BigDecimal moneys;

    /** 描述 (无默认值) */
    private String refer;
}