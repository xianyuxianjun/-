package com.chenxianyu.mapper;

import com.chenxianyu.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

}

