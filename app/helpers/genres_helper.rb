module GenresHelper

  def capitalize_each_word_in_name(genre)
    genre.name.split.map(&:capitalize).join(' ')
  end

end
