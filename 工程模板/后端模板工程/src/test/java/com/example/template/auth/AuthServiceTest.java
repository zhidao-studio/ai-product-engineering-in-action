package com.example.template.auth;

import com.example.template.exception.BusinessException;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class AuthServiceTest {

    private final AuthService authService = new AuthService();

    @Test
    void loginReturnsUserWhenUsernameIsValid() {
        LoginResponse response = authService.login(new LoginRequest("admin", "password"));

        assertEquals("admin", response.user().username());
    }

    @Test
    void loginThrowsWhenUsernameIsInvalid() {
        assertThrows(BusinessException.class, () -> authService.login(new LoginRequest("user", "password")));
    }
}
