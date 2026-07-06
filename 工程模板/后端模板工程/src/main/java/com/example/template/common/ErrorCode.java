package com.example.template.common;

public enum ErrorCode {
    INVALID_REQUEST("INVALID_REQUEST", "请求参数错误"),
    UNAUTHORIZED("UNAUTHORIZED", "未登录或登录失效"),
    FORBIDDEN("FORBIDDEN", "无权限访问"),
    NOT_FOUND("NOT_FOUND", "资源不存在"),
    INTERNAL_ERROR("INTERNAL_ERROR", "服务内部错误");

    private final String code;
    private final String message;

    ErrorCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
