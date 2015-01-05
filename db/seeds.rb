genre_names = "books,business,catalogs,education,entertainment,finance,food & drink,games,health & fitness,lifestyle,medical,music,navigation,news,newsstand,photo & video,productivity,reference,social networking,sports,travel,utilities,weather".split(",")

genre_names.each do |genre_name|
  if !Genre.find_by(name: genre_name)
    Genre.create!({name: genre_name})
  end
end
