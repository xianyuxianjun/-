package com.chenxianyu.service.impl;

import com.chenxianyu.entity.Product;
import com.chenxianyu.mapper.ProductMapper;
import com.chenxianyu.service.IProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

}
