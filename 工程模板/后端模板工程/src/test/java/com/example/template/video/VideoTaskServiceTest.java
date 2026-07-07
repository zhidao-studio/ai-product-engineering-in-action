package com.example.template.video;

import com.example.template.domain.video.bo.CreateVideoTaskBo;
import com.example.template.domain.video.vo.VideoTaskVo;
import com.example.template.mapper.VideoTaskMapper;
import com.example.template.service.IVideoTaskService;
import com.example.template.service.impl.VideoTaskServiceImpl;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.mock;

class VideoTaskServiceTest {

    @Test
    void createTaskBuildsDraftTask() {
        VideoTaskMapper mapper = mock(VideoTaskMapper.class);
        IVideoTaskService service = new VideoTaskServiceImpl(mapper);

        VideoTaskVo task = service.createTask(new CreateVideoTaskBo(
                "2026 俄罗斯留学申请时间线",
                "俄罗斯留学申请",
                "申请节奏",
                "时间轴分镜"
        ));

        assertEquals("draft", task.status());
        assertEquals("2026 俄罗斯留学申请时间线", task.title());
        assertNotNull(task.createdAt());
    }
}
