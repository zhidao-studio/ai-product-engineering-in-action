package com.example.template.controller.v1;

import com.example.template.common.ApiResponse;
import com.example.template.domain.video.bo.CreateVideoTaskBo;
import com.example.template.domain.video.bo.UpdateVideoTaskBo;
import com.example.template.domain.video.vo.VideoTaskVo;
import com.example.template.service.IVideoTaskService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/video-tasks")
public class VideoTaskController {

    private final IVideoTaskService videoTaskService;

    public VideoTaskController(IVideoTaskService videoTaskService) {
        this.videoTaskService = videoTaskService;
    }

    @GetMapping
    public ApiResponse<List<VideoTaskVo>> listTasks() {
        return ApiResponse.ok(videoTaskService.listTasks());
    }

    @GetMapping("/{id}")
    public ApiResponse<VideoTaskVo> getTask(@PathVariable Long id) {
        return ApiResponse.ok(videoTaskService.getTask(id));
    }

    @PostMapping
    public ApiResponse<VideoTaskVo> createTask(@Valid @RequestBody CreateVideoTaskBo createBo) {
        return ApiResponse.ok(videoTaskService.createTask(createBo));
    }

    @PutMapping("/{id}")
    public ApiResponse<VideoTaskVo> updateTask(
            @PathVariable Long id,
            @Valid @RequestBody UpdateVideoTaskBo updateBo
    ) {
        return ApiResponse.ok(videoTaskService.updateTask(id, updateBo));
    }
}
