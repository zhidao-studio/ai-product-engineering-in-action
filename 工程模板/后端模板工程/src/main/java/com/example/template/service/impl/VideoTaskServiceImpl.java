package com.example.template.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.template.common.ErrorCode;
import com.example.template.domain.video.bo.CreateVideoTaskBo;
import com.example.template.domain.video.bo.UpdateVideoTaskBo;
import com.example.template.domain.video.entity.VideoTask;
import com.example.template.domain.video.vo.VideoTaskVo;
import com.example.template.exception.BusinessException;
import com.example.template.mapper.VideoTaskMapper;
import com.example.template.service.IVideoTaskService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class VideoTaskServiceImpl implements IVideoTaskService {

    private static final long SYSTEM_USER_ID = 0L;

    private final VideoTaskMapper videoTaskMapper;

    public VideoTaskServiceImpl(VideoTaskMapper videoTaskMapper) {
        this.videoTaskMapper = videoTaskMapper;
    }

    @Override
    public List<VideoTaskVo> listTasks() {
        return videoTaskMapper.selectList(new LambdaQueryWrapper<VideoTask>()
                        .eq(VideoTask::getIsValid, true)
                        .eq(VideoTask::getIsDeleted, false)
                        .orderByDesc(VideoTask::getCreatedAt))
                .stream()
                .map(this::toVo)
                .toList();
    }

    @Override
    public VideoTaskVo getTask(Long id) {
        VideoTask task = videoTaskMapper.selectOne(new LambdaQueryWrapper<VideoTask>()
                .eq(VideoTask::getId, id)
                .eq(VideoTask::getIsValid, true)
                .eq(VideoTask::getIsDeleted, false));
        if (task == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND);
        }
        return toVo(task);
    }

    @Override
    public VideoTaskVo createTask(CreateVideoTaskBo createBo) {
        LocalDateTime now = LocalDateTime.now();
        VideoTask task = new VideoTask();
        task.setTitle(createBo.title());
        task.setTopic(createBo.topic());
        task.setScriptSummary(createBo.scriptSummary());
        task.setStoryboardSummary(createBo.storyboardSummary());
        task.setStatus("draft");
        task.setCreatedBy(SYSTEM_USER_ID);
        task.setCreatedAt(now);
        task.setUpdatedBy(SYSTEM_USER_ID);
        task.setUpdatedAt(now);
        task.setIsValid(true);
        task.setIsDeleted(false);
        videoTaskMapper.insert(task);
        return toVo(task);
    }

    @Override
    public VideoTaskVo updateTask(Long id, UpdateVideoTaskBo updateBo) {
        VideoTask task = videoTaskMapper.selectOne(new LambdaQueryWrapper<VideoTask>()
                .eq(VideoTask::getId, id)
                .eq(VideoTask::getIsValid, true)
                .eq(VideoTask::getIsDeleted, false));
        if (task == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND);
        }

        task.setTitle(updateBo.title());
        task.setTopic(updateBo.topic());
        task.setScriptSummary(updateBo.scriptSummary());
        task.setStoryboardSummary(updateBo.storyboardSummary());
        task.setStatus(updateBo.status());
        task.setUpdatedBy(SYSTEM_USER_ID);
        task.setUpdatedAt(LocalDateTime.now());
        videoTaskMapper.updateById(task);
        return toVo(task);
    }

    private VideoTaskVo toVo(VideoTask task) {
        return new VideoTaskVo(
                task.getId(),
                task.getTitle(),
                task.getTopic(),
                task.getScriptSummary(),
                task.getStoryboardSummary(),
                task.getStatus(),
                task.getCreatedAt(),
                task.getUpdatedAt()
        );
    }
}
