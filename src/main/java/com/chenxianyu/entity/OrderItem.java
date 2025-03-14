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
 * 订单明细表
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Getter
@Setter
@ToString
@TableName("order_item")
public class OrderItem implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 明细ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 订单ID
     */
    @TableField("order_id")
    private Long orderId;

    /**
     * 订单编号
     */
    @TableField("order_no")
    private String orderNo;

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
     * 商品名称
     */
    @TableField("item_name")
    private String itemName;

    /**
     * 数量
     */
    @TableField("quantity")
    private Integer quantity;

    /**
     * 单价
     */
    @TableField("price")
    private BigDecimal price;

    /**
     * 小计
     */
    @TableField("subtotal")
    private BigDecimal subtotal;

    /**
     * 商品图片
     */
    @TableField("item_image")
    private String itemImage;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;
}
