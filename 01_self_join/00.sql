CREATE TABLE
  products (
    `name` VARCHAR(64) NOT NULL COMMENT 'product name',
    `price` INT(4) NOT NULL COMMENT 'product price'
  )
;

INSERT INTO
  products (`name`, `price`)
VALUES
  ('apple', 50),
  ('orange', 100),
  ('bananer', 80)
;

SELECT
  t1.name,
  t2.name
FROM
  products t1,
  products t2
WHERE
  t1.name <> t2.name
;

SELECT
  t1.name,
  t2.name
FROM
  products t1,
  products t2
WHERE
  t1.name > t2.name
;

-- 非等值自连接
SELECT
  t1.name,
  t2.name,
  t3.name
FROM
  products t1,
  products t2,
  products t3
WHERE
  t1.name > t2.name
  AND t2.name > t3.name
;

-- 关联子查询
SELECT
  p1.name,
  p1.price
FROM
  products p1
WHERE
  EXISTS (
    SELECT
      p2.name
    FROM
      products p2
    WHERE
      p2.price = p1.price
      AND p2.name <> p1.name
  )
;
