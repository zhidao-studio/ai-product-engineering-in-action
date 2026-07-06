package com.example.template.common;

public enum ErrorCode {
    INVALID_REQUEST("请求参数错误"),
    UNAUTHORIZED("未登录或登录失效"),
    FORBIDDEN("无权限访问"),
    NOT_FOUND("资源不存在"),
    INTERNAL_ERROR("服务内部错误");

    private final String message;

    ErrorCode(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
