json.array!(@pivot_tbls) do |pivot_tbl|
  json.extract! pivot_tbl, :id
  json.url pivot_tbl_url(pivot_tbl, format: :json)
end
