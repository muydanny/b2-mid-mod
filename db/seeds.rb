# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@paramount = Studio.create(name: "Paramount", location: "California" )
@a24 = Studio.create(name: "A24", location: "New York" )
@interstellar = @paramount.movies.create(title: "Interstellar", creation_year: 2014, genre: "Sci-fi")
@midsommar = @a24.movies.create(title: "Midsommar", creation_year: 2019, genre: "Horror")
@moonlight = @a24.movies.create(title: "Moonlight", creation_year: 2016, genre: "Drama")
@florence = @midsommar.actors.create(name: "Florence Pugh", age: 24)
@will = @midsommar.actors.create(name: "Will Poulter", age: 26)
@jack = @midsommar.actors.create(name: "Jack Reynor", age: 27)
@harper = @midsommar.actors.create(name: "Harper", age: 40)
