package com.chenxianyu.mapper;

import com.chenxianyu.entity.OrderItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 订单明细表 Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Mapper
public interface OrderItemMapper extends BaseMapper<OrderItem> {

}

