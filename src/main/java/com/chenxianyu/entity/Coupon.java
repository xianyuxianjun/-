package com.chenxianyu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/**
 * <p>
 * 优惠券表
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Getter
@Setter
@ToString
@TableName("coupon")
public class Coupon implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 优惠券ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 优惠券名称
     */
    @TableField("name")
    private String name;

    /**
     * 类型(1满减券,2折扣券,3无门槛券)
     */
    @TableField("type")
    private Byte type;

    /**
     * 面值
     */
    @TableField("value")
    private BigDecimal value;

    /**
     * 使用门槛
     */
    @TableField("min_amount")
    private BigDecimal minAmount;

    /**
     * 发行数量
     */
    @TableField("total")
    private Integer total;

    /**
     * 剩余数量
     */
    @TableField("remain")
    private Integer remain;

    /**
     * 每人限领数量
     */
    @TableField("limit_per_user")
    private Integer limitPerUser;

    /**
     * 开始时间
     */
    @TableField("start_time")
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    @TableField("end_time")
    private LocalDateTime endTime;

    /**
     * 状态(0无效,1有效)
     */
    @TableField("status")
    private Byte status;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;
}
