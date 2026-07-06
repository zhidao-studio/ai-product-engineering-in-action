package com.example.template.controller.v1;

import com.example.template.common.ApiResponse;
import com.example.template.domain.auth.bo.LoginBo;
import com.example.template.domain.auth.vo.LoginVo;
import com.example.template.service.IAuthService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/session")
public class AuthController {

    private final IAuthService authService;

    public AuthController(IAuthService authService) {
        this.authService = authService;
    }

    @PostMapping
    public ApiResponse<LoginVo> login(
            @RequestHeader(value = "X-Client-Type", required = false) String clientType,
            @Valid @RequestBody LoginBo loginBo
    ) {
        LoginBo command = new LoginBo(loginBo.username(), loginBo.password(), clientType);
        return ApiResponse.ok(authService.login(command));
    }
}
