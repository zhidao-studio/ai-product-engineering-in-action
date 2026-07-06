package com.example.template.domain.auth.bo;

import jakarta.validation.constraints.NotBlank;

public record LoginBo(
        @NotBlank String username,
        @NotBlank String password,
        String clientType
) {
}
