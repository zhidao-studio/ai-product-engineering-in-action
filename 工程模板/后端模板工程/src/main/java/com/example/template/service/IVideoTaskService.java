package com.example.template.service;

import com.example.template.domain.video.bo.CreateVideoTaskBo;
import com.example.template.domain.video.bo.UpdateVideoTaskBo;
import com.example.template.domain.video.vo.VideoTaskVo;

import java.util.List;

public interface IVideoTaskService {

    List<VideoTaskVo> listTasks();

    VideoTaskVo getTask(Long id);

    VideoTaskVo createTask(CreateVideoTaskBo createBo);

    VideoTaskVo updateTask(Long id, UpdateVideoTaskBo updateBo);
}
