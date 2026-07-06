package com.example.template.auth;

import com.example.template.domain.auth.bo.LoginBo;
import com.example.template.domain.auth.vo.LoginVo;
import com.example.template.exception.BusinessException;
import com.example.template.service.IAuthService;
import com.example.template.service.impl.AuthServiceImpl;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class AuthServiceTest {

    private final IAuthService authService = new AuthServiceImpl();

    @Test
    void loginReturnsUserWhenUsernameIsValid() {
        LoginVo response = authService.login(new LoginBo("admin", "password", "web-admin"));

        assertEquals("admin", response.user().username());
    }

    @Test
    void loginThrowsWhenUsernameIsInvalid() {
        assertThrows(BusinessException.class, () -> authService.login(new LoginBo("user", "password", "h5")));
    }
}
