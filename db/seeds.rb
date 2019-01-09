Cut.create!([
  {id: 14, program_id: 11, order_id: 33, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", width: 600, height: 600, tracking_id: 99, quantity: 3},
  {id: 15, program_id: 11, order_id: 33, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", width: 900, height: 900, tracking_id: 106, quantity: 2},
  {id: 16, program_id: 12, order_id: 33, created_at: "2019-01-09 13:29:36", updated_at: "2019-01-09 13:29:36", width: 600, height: 600, tracking_id: 99, quantity: 7},
  {id: 17, program_id: 13, order_id: 33, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", width: 900, height: 900, tracking_id: 106, quantity: 3},
  {id: 18, program_id: 13, order_id: 34, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", width: 800, height: 800, tracking_id: 110, quantity: 3},
  {id: 19, program_id: 14, order_id: 33, created_at: "2019-01-09 13:32:14", updated_at: "2019-01-09 13:32:14", width: 1200, height: 1500, tracking_id: 103, quantity: 3}
])
User.create!([
  {id: 1, username: "admin", email: "admin@glass.com", password: "admin", password_confirmation: "admin", remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: true},
  {id: 2, username: "user", email: "user@glass.com", password: "user", password_confirmation: "user", remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: false}
])
Order.create!([
  {id: 33, customer: "New Customer", description: "A description", priority: "2 - Normal", delivery_address: "An address", created_at: "2019-01-09 13:23:19", updated_at: "2019-01-09 13:23:47", activated_date: "2019-01-09 13:23:47", last_activation_message: "Activation Complete!", status: "activated"},
  {id: 34, customer: "Customer 2", description: "Another description", priority: "2 - Normal", delivery_address: "Address 2", created_at: "2019-01-09 13:26:12", updated_at: "2019-01-09 13:26:17", activated_date: "2019-01-09 13:26:17", last_activation_message: "Activation Complete!", status: "activated"}
])
Activity.create!([
  {id: 107, user_id: 1, created_at: "2019-01-09 13:23:19", updated_at: "2019-01-09 13:23:19", object_id: 33, object_type: "Order", action: "created", quantity: nil},
  {id: 108, user_id: 1, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", object_id: 33, object_type: "Order", action: "activated", quantity: nil},
  {id: 109, user_id: 1, created_at: "2019-01-09 13:26:12", updated_at: "2019-01-09 13:26:12", object_id: 34, object_type: "Order", action: "created", quantity: nil},
  {id: 110, user_id: 1, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:26:17", object_id: 34, object_type: "Order", action: "activated", quantity: nil},
  {id: 111, user_id: 1, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", object_id: 99, object_type: "Tracking", action: "performed", quantity: 3},
  {id: 112, user_id: 1, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", object_id: 106, object_type: "Tracking", action: "performed", quantity: 2},
  {id: 113, user_id: 1, created_at: "2019-01-09 13:29:36", updated_at: "2019-01-09 13:29:36", object_id: 99, object_type: "Tracking", action: "performed", quantity: 7},
  {id: 114, user_id: 1, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", object_id: 106, object_type: "Tracking", action: "performed", quantity: 3},
  {id: 115, user_id: 1, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", object_id: 110, object_type: "Tracking", action: "performed", quantity: 3},
  {id: 116, user_id: 1, created_at: "2019-01-09 13:32:14", updated_at: "2019-01-09 13:32:14", object_id: 103, object_type: "Tracking", action: "performed", quantity: 3}
])
ProductLine.create!([
  {id: 25, product_id: 1, order_id: 33, holes_quantity: 0, polish_type_id: 1, tempered: true, quantity: 10, description: nil, width: 600, height: 600, created_at: "2019-01-09 13:23:19", updated_at: "2019-01-09 13:23:19"},
  {id: 26, product_id: 3, order_id: 33, holes_quantity: 4, polish_type_id: 3, tempered: false, quantity: 5, description: nil, width: 1200, height: 1500, created_at: "2019-01-09 13:23:19", updated_at: "2019-01-09 13:23:19"},
  {id: 27, product_id: 1, order_id: 33, holes_quantity: 0, polish_type_id: 1, tempered: true, quantity: 10, description: nil, width: 900, height: 900, created_at: "2019-01-09 13:23:19", updated_at: "2019-01-09 13:23:19"},
  {id: 28, product_id: 1, order_id: 34, holes_quantity: 4, polish_type_id: 3, tempered: false, quantity: 8, description: nil, width: 800, height: 800, created_at: "2019-01-09 13:26:12", updated_at: "2019-01-09 13:26:12"},
  {id: 29, product_id: 5, order_id: 34, holes_quantity: 0, polish_type_id: 2, tempered: false, quantity: 4, description: nil, width: 1000, height: 1000, created_at: "2019-01-09 13:26:12", updated_at: "2019-01-09 13:26:12"}
])
PolishType.create!([
  {id: 1, name: "Flat Polish", created_at: "2018-11-01 21:52:56", updated_at: "2018-11-01 21:52:56"},
  {id: 2, name: "Pencil Edge", created_at: "2018-11-01 21:53:13", updated_at: "2018-11-01 21:53:13"},
  {id: 3, name: "None", created_at: "2018-11-12 21:53:18", updated_at: "2018-11-12 21:53:18"}
])
Product.create!([
  {id: 1, name: "Float 4mm Clear", code: "FL4CLE", thickness: 4, max_width: 3600, max_height: 3600, price_per_m2: 15.0, created_at: "2018-11-01 21:58:09", updated_at: "2018-11-01 21:58:09"},
  {id: 2, name: "Float 8mm Clear", code: "FL8CLE", thickness: 8, max_width: 3600, max_height: 3600, price_per_m2: 33.5, created_at: "2018-11-01 21:59:17", updated_at: "2018-11-01 21:59:17"},
  {id: 3, name: "Float 10mm Clear", code: "FL10CLE", thickness: 10, max_width: 2500, max_height: 2500, price_per_m2: 40.0, created_at: "2018-11-01 21:59:59", updated_at: "2018-11-01 21:59:59"},
  {id: 4, name: "Float 4mm Gray", code: "FL4GRY", thickness: 4, max_width: 3600, max_height: 3600, price_per_m2: 19.0, created_at: "2018-11-01 22:01:36", updated_at: "2018-11-01 22:01:36"},
  {id: 5, name: "Low-E 4mm", code: "LOWE4", thickness: 4, max_width: 3600, max_height: 3600, price_per_m2: 32.0, created_at: "2018-11-01 22:03:34", updated_at: "2018-11-01 22:03:34"},
  {id: 6, name: "Solar-E 6mm", code: "SOLE6", thickness: 6, max_width: 2500, max_height: 2500, price_per_m2: 42.0, created_at: "2018-11-01 22:08:51", updated_at: "2018-11-01 22:08:51"}
])
Program.create!([
  {id: 11, product_id: 1, user_id: 1, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", name: "P1000"},
  {id: 12, product_id: 1, user_id: 1, created_at: "2019-01-09 13:29:36", updated_at: "2019-01-09 13:29:36", name: "P1001"},
  {id: 13, product_id: 1, user_id: 1, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", name: "P1002"},
  {id: 14, product_id: 3, user_id: 1, created_at: "2019-01-09 13:32:14", updated_at: "2019-01-09 13:32:14", name: "P2000"}
])
Stage.create!([
  {id: 1, name: "Cut", workload: 0.08, created_at: "2018-11-01 22:13:05", updated_at: "2018-11-01 22:13:05"},
  {id: 2, name: "Drill", workload: 0.11, created_at: "2018-11-01 22:13:23", updated_at: "2018-11-01 22:13:23"},
  {id: 3, name: "Polish", workload: 0.14, created_at: "2018-11-01 22:13:47", updated_at: "2018-11-01 22:13:47"},
  {id: 4, name: "Temper", workload: 1.5, created_at: "2018-11-01 22:14:51", updated_at: "2018-11-01 22:14:51"},
  {id: 5, name: "Delivery", workload: 0.2, created_at: "2018-11-01 22:16:41", updated_at: "2018-11-01 22:16:41"}
])
Tracking.create!([
  {id: 99, product_line_id: 25, stage_id: 1, done: 10, next_tracking_id: 100, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:29:36", prev_tracking_id: nil},
  {id: 100, product_line_id: 25, stage_id: 3, done: 0, next_tracking_id: 101, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 99},
  {id: 101, product_line_id: 25, stage_id: 4, done: 0, next_tracking_id: 102, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 100},
  {id: 102, product_line_id: 25, stage_id: 5, done: 0, next_tracking_id: nil, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 101},
  {id: 103, product_line_id: 26, stage_id: 1, done: 3, next_tracking_id: 104, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:32:14", prev_tracking_id: nil},
  {id: 104, product_line_id: 26, stage_id: 2, done: 0, next_tracking_id: 105, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 103},
  {id: 105, product_line_id: 26, stage_id: 5, done: 0, next_tracking_id: nil, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 104},
  {id: 106, product_line_id: 27, stage_id: 1, done: 5, next_tracking_id: 107, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:31:11", prev_tracking_id: nil},
  {id: 107, product_line_id: 27, stage_id: 3, done: 0, next_tracking_id: 108, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 106},
  {id: 108, product_line_id: 27, stage_id: 4, done: 0, next_tracking_id: 109, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 107},
  {id: 109, product_line_id: 27, stage_id: 5, done: 0, next_tracking_id: nil, created_at: "2019-01-09 13:23:47", updated_at: "2019-01-09 13:23:47", prev_tracking_id: 108},
  {id: 110, product_line_id: 28, stage_id: 1, done: 3, next_tracking_id: 111, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:31:11", prev_tracking_id: nil},
  {id: 111, product_line_id: 28, stage_id: 2, done: 0, next_tracking_id: 112, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:26:17", prev_tracking_id: 110},
  {id: 112, product_line_id: 28, stage_id: 5, done: 0, next_tracking_id: nil, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:26:17", prev_tracking_id: 111},
  {id: 113, product_line_id: 29, stage_id: 1, done: 0, next_tracking_id: 114, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:26:17", prev_tracking_id: nil},
  {id: 114, product_line_id: 29, stage_id: 3, done: 0, next_tracking_id: 115, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:26:17", prev_tracking_id: 113},
  {id: 115, product_line_id: 29, stage_id: 5, done: 0, next_tracking_id: nil, created_at: "2019-01-09 13:26:17", updated_at: "2019-01-09 13:26:17", prev_tracking_id: 114}
])
WorkLog.create!([
  {id: 107, tracking_id: 99, user_id: 1, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", quantity: 3},
  {id: 108, tracking_id: 106, user_id: 1, created_at: "2019-01-09 13:28:11", updated_at: "2019-01-09 13:28:11", quantity: 2},
  {id: 109, tracking_id: 99, user_id: 1, created_at: "2019-01-09 13:29:36", updated_at: "2019-01-09 13:29:36", quantity: 7},
  {id: 110, tracking_id: 106, user_id: 1, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", quantity: 3},
  {id: 111, tracking_id: 110, user_id: 1, created_at: "2019-01-09 13:31:11", updated_at: "2019-01-09 13:31:11", quantity: 3},
  {id: 112, tracking_id: 103, user_id: 1, created_at: "2019-01-09 13:32:14", updated_at: "2019-01-09 13:32:14", quantity: 3}
])
