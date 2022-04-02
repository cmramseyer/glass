-- try crosstab() pg extension
SELECT 
  main.id id,
  main.priority,
  main.customer,
  main.status,
  SUM(CASE WHEN main.name = 'Cut' THEN main.completion ELSE 0 END) cut,
  SUM(CASE WHEN main.name = 'Drill' THEN main.completion ELSE 0 END) drill,
  SUM(CASE WHEN main.name = 'Polish' THEN main.completion ELSE 0 END) polish,
  SUM(CASE WHEN main.name = 'Temper' THEN main.completion ELSE 0 END) temper,
  SUM(CASE WHEN main.name = 'Delivery' THEN main.completion ELSE 0 END) delivery
	

FROM
( SELECT sub.id, sub.status, sub.priority, sub.customer, sub.name, ROUND((sub.done::numeric / sub.qty::numeric * 100.0)::numeric, 2) completion
  FROM
    (
      SELECT o.*, s.name, SUM(t.done) done, SUM(pl.quantity) qty
      FROM orders o
      INNER JOIN product_lines pl
      ON pl.order_id = o.id
      INNER JOIN trackings t
      ON t.product_line_id = pl.id
      INNER JOIN stages s
      ON s.id = t.stage_id
      GROUP BY o.id, s.name
    ) sub
) main
GROUP BY 
  main.id,
  main.status,
  main.priority,
  main.customer

