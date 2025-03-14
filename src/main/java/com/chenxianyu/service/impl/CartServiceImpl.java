package com.chenxianyu.service.impl;

import com.chenxianyu.entity.Cart;
import com.chenxianyu.mapper.CartMapper;
import com.chenxianyu.service.ICartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 购物车表 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements ICartService {

}
