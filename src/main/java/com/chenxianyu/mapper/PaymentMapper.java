package com.chenxianyu.mapper;

import com.chenxianyu.entity.Payment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 支付记录表 Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Mapper
public interface PaymentMapper extends BaseMapper<Payment> {

}

