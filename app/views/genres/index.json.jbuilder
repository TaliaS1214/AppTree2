json.array! (@genres) do |genre|
  json.extract! genre, :id
  json.name capitalize_each_word_in_name(genre)
end
