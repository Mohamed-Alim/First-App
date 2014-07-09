json.array!(@books) do |book|
  json.extract! book, :id, :name, :Author_name, :Library_name
  json.url book_url(book, format: :json)
end
