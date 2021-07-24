SELECT
  p.name,
  p.code,
  ROUND((SUM((pl.quantity * pl.width * pl.height / 1000000::numeric))), 2) total_area,
  ROUND((SUM((pl.quantity * pl.width * pl.height * p.thickness * 2.5 / 1000000::numeric))), 2) total_weight
FROM products p
LEFT JOIN product_lines pl
ON p.id = pl.product_id
GROUP BY
  p.name,
  p.code
