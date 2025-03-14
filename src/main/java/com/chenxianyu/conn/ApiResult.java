package com.chenxianyu.conn;

import java.io.Serializable;

/**
 * 通用API响应结果
 * 用于统一前端数据返回格式
 */
public class ApiResult implements Serializable {
    
    private static final long serialVersionUID = 1L;

    /**
     * 状态码
     */
    private Integer code;
    
    /**
     * 返回消息
     */
    private String message;
    
    /**
     * 返回数据
     */
    private Object data;
    
    /**
     * 是否成功
     */
    private Boolean success;

    /**
     * 无参构造函数
     */
    public ApiResult() {
    }

    /**
     * 全参构造函数
     * @param code 状态码
     * @param message 返回消息
     * @param data 返回数据
     */
    public ApiResult(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
        this.success = code.equals(200);
    }
    
    /**
     * 返回成功结果
     * @param data 数据
     * @return ApiResult对象
     */
    public static ApiResult success(Object data) {
        return new ApiResult(200, "操作成功", data);
    }
    
    /**
     * 返回成功结果（带自定义消息）
     * @param data 数据
     * @param message 成功消息
     * @return ApiResult对象
     */
    public static ApiResult success(Object data, String message) {
        return new ApiResult(200, message, data);
    }
    
    /**
     * 返回错误结果
     * @param message 错误消息
     * @return ApiResult对象
     */
    public static ApiResult error(String message) {
        return new ApiResult(500, message, null);
    }
    
    /**
     * 返回错误结果（带自定义状态码）
     * @param code 错误状态码
     * @param message 错误消息
     * @return ApiResult对象
     */
    public static ApiResult error(Integer code, String message) {
        return new ApiResult(code, message, null);
    }
    
    /**
     * 参数错误
     * @param message 错误消息
     * @return ApiResult对象
     */
    public static ApiResult paramError(String message) {
        return new ApiResult(400, message, null);
    }
    
    /**
     * 未授权错误
     * @param message 错误消息
     * @return ApiResult对象
     */
    public static ApiResult unauthorized(String message) {
        return new ApiResult(401, message == null ? "未授权" : message, null);
    }
    
    /**
     * 禁止访问错误
     * @param message 错误消息
     * @return ApiResult对象
     */
    public static ApiResult forbidden(String message) {
        return new ApiResult(403, message == null ? "禁止访问" : message, null);
    }

    // getter和setter方法
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }
} 