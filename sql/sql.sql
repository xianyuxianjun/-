CREATE TABLE `file` (
                         `id` BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
                         `file_name` VARCHAR(255) COMMENT '文件名',
                         `file_path` VARCHAR(255) COMMENT '文件路径',
                         'file_view_path' VARCHAR(255) COMMENT '文件访问路径',
                         `related_type` VARCHAR(255) COMMENT '文件类型',
                         `related_id` BIGINT,
                         `created_at` DATETIME,
                         PRIMARY KEY(`id`)
) COMMENT='文件表';
