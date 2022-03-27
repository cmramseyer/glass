SELECT 
  s.name, 
  wl.created_at::date, 
  ROUND((SUM((wl.quantity::numeric * s.workload::numeric * pl.width::numeric * pl.height::numeric / 1000000.0))), 2) workload
FROM
  work_logs wl
INNER JOIN trackings t ON t.id = wl.tracking_id
INNER JOIN stages s ON t.stage_id = s.id
INNER JOIN product_lines pl ON pl.id = t.product_line_id
WHERE
  wl.created_at > CURRENT_DATE - INTERVAL '14 day'
GROUP BY
  s.name,
  wl.created_at::date
