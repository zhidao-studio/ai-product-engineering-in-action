package com.example.template.application.auth;

public record AuthResult(
        String userId,
        String username,
        String displayName
) {
}
