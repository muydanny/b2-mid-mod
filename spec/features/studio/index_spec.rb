require 'rails_helper'


RSpec.describe "When I visit the studio index page" do
  before(:each) do
    @paramount = Studio.create(name: "Paramount", location: "California" )
    @a24 = Studio.create(name: "A24", location: "New York" )
    @interstellar = @paramount.movies.create(title: "Interstellar", creation_year: 2014, genre: "Sci-fi")
    @midsommar = @a24.movies.create(title: "Midsommar", creation_year: 2019, genre: "Horror")
    @moonlight = @a24.movies.create(title: "Moonlight", creation_year: 2016, genre: "Drama")

  end
  it "see a list of all of the movie studios and names of movies" do

    visit '/studios'

    within ("#studio-#{@paramount.id}") do
      expect(page).to have_content(@paramount.name)
      expect(page).to have_content(@interstellar.title)
      expect(page).to_not have_content(@a24.name)
    end
    within ("#studio-#{@a24.id}") do
      expect(page).to have_content(@a24.name)
      expect(page).to have_content(@midsommar.title)
      expect(page).to have_content(@moonlight.title)
      expect(page).to_not have_content(@paramount.name)
    end
  end
end




# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of
# all of its movies.
