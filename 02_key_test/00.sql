DROP      TABLE IF EXISTS lc_user
;

CREATE    TABLE lc_user (
          `id` INT(11) PRIMARY KEY COMMENT '自增主键',
          `user_name` VARCHAR(32) COMMENT '用户名称' ,
          `user_phone` INT(11) COMMENT '用户电话'    ,
          KEY `idx_user_name` (`user_name`)
          ) COMMENT '用户表'
;

INSERT    INTO lc_user
VALUES    (1, '晓空', '123')
;

DROP      TABLE IF EXISTS lc_user_tmp
;

CREATE    TABLE lc_user_tmp (
          `id` INT(11) PRIMARY KEY COMMENT '自增主键',
          `user_name` VARCHAR(32) COMMENT '用户名称' ,
          KEY `idx_user_name` (`user_name`)
          ) COMMENT '用户表'
;

INSERT    INTO lc_user_tmp
VALUES    (1, '晓空')
;

-- 全表扫描
EXPLAIN  
SELECT    *
FROM      lc_user
WHERE     user_name LIKE '%空'
;

-- 走use_name索引 maybe索引覆盖
EXPLAIN  
SELECT    *
FROM      lc_user_tmp
WHERE     user_name LIKE '%空'
;
