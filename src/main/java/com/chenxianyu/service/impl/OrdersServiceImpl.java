package com.chenxianyu.service.impl;

import com.chenxianyu.entity.Orders;
import com.chenxianyu.mapper.OrdersMapper;
import com.chenxianyu.service.IOrdersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersService {

}
