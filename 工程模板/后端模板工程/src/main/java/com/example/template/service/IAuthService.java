package com.example.template.service;

import com.example.template.domain.auth.bo.LoginBo;
import com.example.template.domain.auth.vo.LoginVo;

public interface IAuthService {

    LoginVo login(LoginBo loginBo);
}
