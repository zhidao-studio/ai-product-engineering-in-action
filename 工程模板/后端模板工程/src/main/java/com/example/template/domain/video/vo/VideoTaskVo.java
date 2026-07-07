package com.example.template.domain.video.vo;

import java.time.LocalDateTime;

public record VideoTaskVo(
        String id,
        String title,
        String topic,
        String scriptSummary,
        String storyboardSummary,
        String status,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
}
