package com.example.template.auth;

import com.example.template.common.ErrorCode;
import com.example.template.exception.BusinessException;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    public LoginResponse login(LoginRequest request) {
        if (!"admin".equals(request.username())) {
            throw new BusinessException(ErrorCode.UNAUTHORIZED);
        }

        UserInfo user = new UserInfo("1", "admin", "系统管理员");
        return new LoginResponse(user);
    }
}
