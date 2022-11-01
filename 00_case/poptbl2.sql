CREATE TABLE
  poptbl2 (
    pref_name VARCHAR(64) NOT NULL COMMENT '县名',
    sex INT(3) NOT NULL COMMENT '性别',
    population INT(8) NOT NULL COMMENT '人口'
  ) COMMENT = '统计源表poptbl2';

INSERT INTO
  poptbl2 (pref_name, sex, population)
VALUES
  ('德岛', 1, 60),
  ('德岛', 2, 40),
  ('香川', 1, 100),
  ('香川', 2, 100),
  ('爱媛', 1, 100),
  ('爱媛', 2, 50),
  ('高知', 1, 100),
  ('高知', 2, 100),
  ('福冈', 1, 200),
  ('福冈', 2, 20),
  ('佐贺', 1, 80),
  ('佐贺', 2, 60),
  ('长崎', 1, 125),
  ('长崎', 2, 125),
  ('东京', 1, 250),
  ('东京', 2, 150);

-- 行业转换,在表头里加入汇总和再揭
SELECT
  CASE
    WHEN sex = '1' THEN '男'
    WHEN sex = '2' THEN '女'
  END AS '性别',
  SUM(population) AS '全国',
  SUM(
    CASE
      WHEN pref_name = '德岛' THEN population
      ELSE 0
    END
  ) AS '德岛',
  SUM(
    CASE
      WHEN pref_name = '香川' THEN population
      ELSE 0
    END
  ) AS '香川',
  SUM(
    CASE
      WHEN pref_name = '爱媛' THEN population
      ELSE 0
    END
  ) AS '爱媛',
  SUM(
    CASE
      WHEN pref_name = '高知' THEN population
      ELSE 0
    END
  ) AS '高知',
  SUM(
    CASE
      WHEN pref_name IN ('德岛', '香川', '爱媛', '高知') THEN population
      ELSE 0
    END
  ) AS '四国(再揭)'
FROM
  poptbl2
GROUP BY
  1;
