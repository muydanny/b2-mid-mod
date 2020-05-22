require 'rails_helper'


RSpec.describe "When I visit the movie's show page" do
  before(:each) do
    @paramount = Studio.create(name: "Paramount", location: "California" )
    @a24 = Studio.create(name: "A24", location: "New York" )
    @interstellar = @paramount.movies.create(title: "Interstellar", creation_year: 2014, genre: "Sci-fi")
    @midsommar = @a24.movies.create(title: "Midsommar", creation_year: 2019, genre: "Horror")
    @moonlight = @a24.movies.create(title: "Moonlight", creation_year: 2016, genre: "Drama")
    @florence = @midsommar.actors.create(name: "Florence Pugh", age: 24)
    @will = @midsommar.actors.create(name: "Will Poulter", age: 26)
    @jack = @midsommar.actors.create(name: "Jack Reynor", age: 27)
    @harper = @midsommar.actors.create(name: "Harper", age: 40)
  end
  it "I see movies title, creation year, and genre" do

    visit "/movies/#{@midsommar.id}"

    expect(page).to have_content(@midsommar.title)
    expect(page).to have_content(@midsommar.creation_year)
    expect(page).to have_content(@midsommar.genre)
    expect(page).to_not have_content(@moonlight.title)
  end

  it "list of all its actors from youngest to oldest" do

    visit "/movies/#{@midsommar.id}"

    expect("Florence Pugh").to appear_before("Will Poulter")
    expect("Will Poulter").to appear_before("Jack Reynor")
    expect("Jack Reynor").to appear_before("Harper")

  end
  it "I see the average age of all of the movie's actors" do

    visit "/movies/#{@midsommar.id}"

    expect(page).to have_content("Average Age of Actors: 29")

  end
  it "see form for an actors name" do
    visit "/movies/#{@midsommar.id}"

    expect(page).not_to have_content("Tom")
    expect(page).not_to have_content("Age: 43")

    click_link("Create Actor")
    
  end
end


# As a visitor,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)


# # When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
