json.array!(@libraries) do |library|
  json.extract! library, :id, :Name, :URL
  json.url library_url(library, format: :json)
end
