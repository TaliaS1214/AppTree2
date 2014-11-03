# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genre_names = "books,business,catalogs,education,entertainment,finance,food & drink,games,health & fitness,lifestyle,medical,music,navigation,news,newsstand,photo & video,productivity,reference,social networking,sports,travel,utilities,weather".split(",")

genre_names.each do |genre_name|
  if !Genre.find_by(name: genre_name)
    Genre.create!({name: genre_name})
  end
end
