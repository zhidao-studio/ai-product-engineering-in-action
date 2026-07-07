package com.example.template.domain.video.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;

@TableName("video_task")
public class VideoTask {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private String title;
    private String topic;
    private String scriptSummary;
    private String storyboardSummary;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getScriptSummary() {
        return scriptSummary;
    }

    public void setScriptSummary(String scriptSummary) {
        this.scriptSummary = scriptSummary;
    }

    public String getStoryboardSummary() {
        return storyboardSummary;
    }

    public void setStoryboardSummary(String storyboardSummary) {
        this.storyboardSummary = storyboardSummary;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
