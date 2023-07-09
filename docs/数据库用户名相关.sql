-- 我是谁
SHOW      GRANTS
;

-- 修改用户密码
-- PASSWORD()函数将纯文本字符串密码形式计算加密成哈希值
UPDATE    MYSQL.user
SET       PASSWORD = PASSWORD ('MyStrongPassword')
WHERE     USER = ?
AND       HOST = ?
;

-- 如果使用MySQL 5.7.6+版本以上，则必须在UPDATE语句中使用authentication_string列代替password列
UPDATE    MYSQL.user
SET       authentication_string = PASSWORD ('MyStrongPassword')
WHERE     USER = ?
AND       HOST = ?
;

SET       PASSWORD FOR 'user@host' = PASSWORD ('MyStringPassword')
;

ALTER     USER 'user@host' IDENTIFIED BY 'MyStringPassword'
;

FLUSH     PRIVILEGES
;
