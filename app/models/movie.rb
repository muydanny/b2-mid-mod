class Movie < ApplicationRecord
  validates_presence_of :title, :creation_year, :genre
  has_many :movie_actors
  has_many :actors, through: :movie_actors

end
