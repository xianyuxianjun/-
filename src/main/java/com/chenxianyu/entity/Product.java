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
 * 商品表
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Getter
@Setter
@ToString
@TableName("product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 商品ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 商品名称
     */
    @TableField("name")
    private String name;

    /**
     * 分类ID
     */
    @TableField("category_id")
    private Long categoryId;

    /**
     * 品牌
     */
    @TableField("brand")
    private String brand;

    /**
     * 原价
     */
    @TableField("original_price")
    private BigDecimal originalPrice;

    /**
     * 售价
     */
    @TableField("price")
    private BigDecimal price;

    /**
     * 库存量
     */
    @TableField("stock")
    private Integer stock;

    /**
     * 状态(0下架,1上架)
     */
    @TableField("status")
    private Byte status;

    /**
     * 描述
     */
    @TableField("description")
    private String description;

    /**
     * 规格
     */
    @TableField("specs")
    private String specs;

    /**
     * 是否新品(0否,1是)
     */
    @TableField("is_new")
    private Byte isNew;

    /**
     * 是否热销(0否,1是)
     */
    @TableField("is_hot")
    private Byte isHot;

    /**
     * 销量
     */
    @TableField("sales")
    private Integer sales;

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
