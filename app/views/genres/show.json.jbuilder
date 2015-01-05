json.genreName(@genre.name)
json.apps (@genre.apps) do |app|
  json.merge! app.attributes
  json.name format_name(app)
end
