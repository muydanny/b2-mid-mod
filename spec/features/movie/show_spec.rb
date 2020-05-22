require 'rails_helper'


RSpec.describe "When I visit the movie's show page" do
  before(:each) do
    @paramount = Studio.create(name: "Paramount", location: "California" )
    @a24 = Studio.create(name: "A24", location: "New York" )
    @interstellar = @paramount.movies.create(title: "Interstellar", creation_year: 2014, genre: "Sci-fi")
    @midsommar = @a24.movies.create(title: "Midsommar", creation_year: 2019, genre: "Horror")
    @moonlight = @a24.movies.create(title: "Moonlight", creation_year: 2016, genre: "Drama")
  end
  it "I see movies title, creation year, and genre" do

    visit "/movies/#{@midsommar.id}"

    expect(page).to have_content(@midsommar.title)
    expect(page).to have_content(@midsommar.creation_year)
    expect(page).to have_content(@midsommar.genre)
  end
end

# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
