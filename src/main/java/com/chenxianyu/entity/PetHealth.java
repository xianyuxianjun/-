package com.chenxianyu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/**
 * <p>
 * 宠物健康档案表
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Getter
@Setter
@ToString
@TableName("pet_health")
public class PetHealth implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 档案ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 宠物ID
     */
    @TableField("pet_id")
    private Long petId;

    /**
     * 档案编号
     */
    @TableField("health_code")
    private String healthCode;

    /**
     * 疫苗类型
     */
    @TableField("vaccine_type")
    private String vaccineType;

    /**
     * 接种日期
     */
    @TableField("injection_date")
    private LocalDate injectionDate;

    /**
     * 有效期
     */
    @TableField("valid_until")
    private LocalDate validUntil;

    /**
     * 体重(kg)
     */
    @TableField("weight")
    private BigDecimal weight;

    /**
     * 健康状态
     */
    @TableField("health_status")
    private String healthStatus;

    /**
     * 备注
     */
    @TableField("notes")
    private String notes;

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
