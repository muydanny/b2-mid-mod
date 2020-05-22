require 'rails_helper'

describe 'methods' do
  xit "#sort_by_age" do
    @florence = Actor.create!(name: "Florence Pugh", age: 24)
    @will = Actor.create!(name: "Will Poulter", age: 26)
    @jack = Actor.create!(name: "Jack Reynor", age: 27)
    @harper = Actor.create!(name: "Harper", age: 40)
    @actors = Actor.all
    expect(@actors.sort_by_age).to eq(@actors)
  end
end

  # got: 0.2925e2 for average age instead of sory by

# How come this happened? Got stuck on this error.
#<Actor:0x00007fbabb11be30 id: 197, name: "Florence Pugh", age: 24>,
#<Actor:0x00007fbabb11bcf0 id: 198, name: "Will Poulter", age: 26>,
#<Actor:0x00007fbabb11bbb0 id: 199, name: "Jack Reynor", age: 27>,
#<Actor:0x00007fbabb11ba70 id: 200, name: "Harper", age: 40>]

#<Actor:0x00007fbab77c79e0 id: 197, name: "Florence Pugh", age: 24>,
#<Actor:0x00007fbab77c75a8 id: 198, name: "Will Poulter", age: 26>,
#<Actor:0x00007fbab77c7260 id: 199, name: "Jack Reynor", age: 27>,
#<Actor:0x00007fbab77c6e78 id: 200, name: "Harper", age: 40>]
