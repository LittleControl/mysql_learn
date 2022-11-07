INSERT INTO
  products (`name`, `price`)
VALUES
  ('purples', '50'),
  ('watermelon', '80'),
  ('lemon', '30')
;

-- 窗口函数/OLAP函数/分析函数
SELECT
  NAME,
  price,
  RANK() OVER (
    ORDER BY
      price DESC
  ) AS rank_1,
  DENSE_RANK() OVER (
    ORDER BY
      price DESC
  ) AS rank_2
FROM
  products
;

-- 非等值自连接方式
SELECT
  p1.name,
  p1.price,
  (
    SELECT
      COUNT(p2.price)
    FROM
      products p2
    WHERE
      p2.price > p1.price
  ) + 1 AS rank_1
FROM
  products p1
ORDER BY
  rank_1
;

SELECT
  p1.name,
  p1.price,
  (
    SELECT
      COUNT(DISTINCT p2.price)
    FROM
      products p2
    WHERE
      p2.price > p1.price
  ) + 1 AS rank_1
FROM
  products p1
ORDER BY
  rank_1
;
