User.create!([
  {id: 1, username: "admin", email: "admin@glass.com", password: "admin", password_confirmation: "admin", remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: true},
  {id: 2, username: "user", email: "user@glass.com", password: "user", password_confirmation: "user", remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: false}
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
