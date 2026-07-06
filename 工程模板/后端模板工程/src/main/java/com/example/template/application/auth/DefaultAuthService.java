package com.example.template.application.auth;

import com.example.template.common.ErrorCode;
import com.example.template.exception.BusinessException;
import org.springframework.stereotype.Service;

@Service
public class DefaultAuthService implements AuthService {

    @Override
    public AuthResult login(LoginCommand command) {
        if (!"admin".equals(command.username())) {
            throw new BusinessException(ErrorCode.UNAUTHORIZED);
        }

        return new AuthResult("1", "admin", "系统管理员");
    }
}
