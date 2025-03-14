package com.chenxianyu.service.impl;

import com.chenxianyu.entity.Payment;
import com.chenxianyu.mapper.PaymentMapper;
import com.chenxianyu.service.IPaymentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 支付记录表 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Service
public class PaymentServiceImpl extends ServiceImpl<PaymentMapper, Payment> implements IPaymentService {

}
