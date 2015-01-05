json.array! (@apps) do |app|
  json.extract! app, :id
  json.name format_name(app)
end
