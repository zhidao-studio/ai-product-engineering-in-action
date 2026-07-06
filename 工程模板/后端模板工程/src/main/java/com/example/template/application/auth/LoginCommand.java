package com.example.template.application.auth;

public record LoginCommand(
        String username,
        String password,
        String clientType
) {
}
