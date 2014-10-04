json.array!(@test2s) do |test2|
  json.extract! test2, :id, :name, :temperature
  json.url test2_url(test2, format: :json)
end
