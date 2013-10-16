json.array!(@workers) do |worker|
  json.extract! worker, :first_name, :last_name
  json.url worker_url(worker, format: :json)
end
