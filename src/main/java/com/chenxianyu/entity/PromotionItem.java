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
 * 活动商品表
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Getter
@Setter
@ToString
@TableName("promotion_item")
public class PromotionItem implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 活动ID
     */
    @TableField("promotion_id")
    private Long promotionId;

    /**
     * 商品类型(pet/product)
     */
    @TableField("item_type")
    private String itemType;

    /**
     * 商品ID
     */
    @TableField("item_id")
    private Long itemId;

    /**
     * 促销价格
     */
    @TableField("promotion_price")
    private BigDecimal promotionPrice;

    /**
     * 促销库存
     */
    @TableField("promotion_stock")
    private Integer promotionStock;

    /**
     * 每人限购
     */
    @TableField("limit_per_user")
    private Integer limitPerUser;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;
}
