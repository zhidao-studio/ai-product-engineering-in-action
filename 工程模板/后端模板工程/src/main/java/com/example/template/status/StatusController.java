package com.example.template.status;

import com.example.template.common.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/status")
public class StatusController {

    @GetMapping
    public ApiResponse<Map<String, String>> status() {
        return ApiResponse.ok(Map.of("status", "UP"));
    }
}
