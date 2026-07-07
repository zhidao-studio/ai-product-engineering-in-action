package com.example.template.domain.video.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;

@TableName("video_task")
public class VideoTask {

    @TableId
    private String id;
    private String title;
    private String topic;
    private String scriptSummary;
    private String storyboardSummary;
    private String status;
    private String createdBy;
    private LocalDateTime createdAt;
    private String updatedBy;
    private LocalDateTime updatedAt;
    @TableField("is_valid")
    private Integer validFlag;
    @TableField("is_deleted")
    private Integer removedFlag;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getTopic() { return topic; }
    public void setTopic(String topic) { this.topic = topic; }
    public String getScriptSummary() { return scriptSummary; }
    public void setScriptSummary(String scriptSummary) { this.scriptSummary = scriptSummary; }
    public String getStoryboardSummary() { return storyboardSummary; }
    public void setStoryboardSummary(String storyboardSummary) { this.storyboardSummary = storyboardSummary; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    public Integer getValidFlag() { return validFlag; }
    public void setValidFlag(Integer validFlag) { this.validFlag = validFlag; }
    public Integer getRemovedFlag() { return removedFlag; }
    public void setRemovedFlag(Integer removedFlag) { this.removedFlag = removedFlag; }
}
