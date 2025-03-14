package com.chenxianyu.service.impl;

import com.chenxianyu.entity.OperationLog;
import com.chenxianyu.mapper.OperationLogMapper;
import com.chenxianyu.service.IOperationLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志表 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2025-03-14
 */
@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogMapper, OperationLog> implements IOperationLogService {

}
