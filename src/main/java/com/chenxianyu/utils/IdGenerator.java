package com.chenxianyu.utils;

/**
 * ID生成器工具类
 * 生成递增的唯一ID
 */
public class IdGenerator {
    // 开始时间戳（2024-01-01 00:00:00）
    private final static long START_TIMESTAMP = 1704038400000L;
    
    // 序列号占用的位数
    private final static long SEQUENCE_BIT = 12;   // 序列号占用位数
    
    // 序列号最大值 (4095)
    private final static long MAX_SEQUENCE = ~(-1L << SEQUENCE_BIT);
    
    // 时间戳向左移动的位数
    private final static long TIMESTAMP_LEFT = SEQUENCE_BIT;
    
    private static long sequence = 0L; // 序列号
    private static long lastTimestamp = -1L; // 上一次时间戳
    
    private IdGenerator() {
        throw new UnsupportedOperationException("工具类不能实例化");
    }
    
    /**
     * 获取下一个ID
     * @return 生成的ID
     */
    public static synchronized long nextId() {
        long timestamp = timeGen();
        // 如果当前时间小于上一次ID生成的时间戳，说明系统时钟回退过，抛出异常
        if (timestamp < lastTimestamp) {
            throw new RuntimeException("时钟回退，拒绝生成ID");
        }
        
        // 如果是同一时间生成的，则进行序列号自增
        if (lastTimestamp == timestamp) {
            sequence = (sequence + 1) & MAX_SEQUENCE;
            // 序列号已达到最大值，等待下一毫秒
            if (sequence == 0L) {
                timestamp = tilNextMillis(lastTimestamp);
            }
        } else {
            // 时间戳改变，序列号重置为0
            sequence = 0L;
        }
        
        lastTimestamp = timestamp;
        
        // 组合时间戳和序列号为一个64位的ID
        return ((timestamp - START_TIMESTAMP) << TIMESTAMP_LEFT) | sequence;
    }
    
    /**
     * 等待下一个毫秒的到来
     * @param lastTimestamp 上次生成ID的时间戳
     * @return 下一个毫秒的时间戳
     */
    private static long tilNextMillis(long lastTimestamp) {
        long timestamp = timeGen();
        while (timestamp <= lastTimestamp) {
            timestamp = timeGen();
        }
        return timestamp;
    }
    
    /**
     * 获取当前时间戳
     * @return 当前时间戳
     */
    private static long timeGen() {
        return System.currentTimeMillis();
    }
} 