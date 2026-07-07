package com.example.template.domain.video.bo;

import jakarta.validation.constraints.NotBlank;

public record UpdateVideoTaskBo(
        @NotBlank String title,
        @NotBlank String topic,
        String scriptSummary,
        String storyboardSummary,
        @NotBlank String status
) {
}
