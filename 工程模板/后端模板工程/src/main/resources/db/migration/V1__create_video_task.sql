CREATE TABLE video_task (
    id BIGINT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    topic VARCHAR(200) NOT NULL,
    script_summary VARCHAR(1000),
    storyboard_summary VARCHAR(1000),
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE INDEX idx_video_task_status ON video_task(status);
CREATE INDEX idx_video_task_created_at ON video_task(created_at);
