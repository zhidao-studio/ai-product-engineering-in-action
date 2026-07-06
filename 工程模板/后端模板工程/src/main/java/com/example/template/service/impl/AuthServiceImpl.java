package com.example.template.service.impl;

import com.example.template.common.ErrorCode;
import com.example.template.domain.auth.bo.LoginBo;
import com.example.template.domain.auth.vo.LoginVo;
import com.example.template.domain.auth.vo.UserVo;
import com.example.template.exception.BusinessException;
import com.example.template.service.IAuthService;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements IAuthService {

    @Override
    public LoginVo login(LoginBo loginBo) {
        if (!"admin".equals(loginBo.username())) {
            throw new BusinessException(ErrorCode.UNAUTHORIZED);
        }

        UserVo user = new UserVo("1", "admin", "系统管理员");
        return new LoginVo(user);
    }
}
