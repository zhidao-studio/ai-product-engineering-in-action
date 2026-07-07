CREATE TABLE video_task (
    id CHAR(32) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    topic VARCHAR(200) NOT NULL,
    script_summary VARCHAR(1000),
    storyboard_summary VARCHAR(1000),
    status VARCHAR(50) NOT NULL DEFAULT 'draft',
    created_by CHAR(32) NOT NULL DEFAULT '00000000000000000000000000000000',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by CHAR(32) NOT NULL DEFAULT '00000000000000000000000000000000',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_valid TINYINT(1) NOT NULL DEFAULT 1,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0
);

CREATE INDEX idx_video_task_status ON video_task(status);
CREATE INDEX idx_video_task_created_at ON video_task(created_at);
CREATE INDEX idx_video_task_created_by ON video_task(created_by);
CREATE INDEX idx_video_task_valid_deleted ON video_task(is_valid, is_deleted);

DELIMITER $$

CREATE TRIGGER trg_video_task_bi
BEFORE INSERT ON video_task
FOR EACH ROW
BEGIN
    IF NEW.created_at IS NULL THEN
        SET NEW.created_at = CURRENT_TIMESTAMP;
    END IF;
    IF NEW.updated_at IS NULL THEN
        SET NEW.updated_at = CURRENT_TIMESTAMP;
    END IF;
END$$

CREATE TRIGGER trg_video_task_bu
BEFORE UPDATE ON video_task
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

DELIMITER ;
