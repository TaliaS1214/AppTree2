json.genreName(@genre.name)
json.apps (@genre.apps) do |app|
  json.merge! app.attributes
end
