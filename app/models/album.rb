class Album < ApplicationRecord

  @@possible_genres = ["Rock", "Electronic", "Classical", "Blues", "Country", "Rap"]
  validates_presence_of :title, :artist, :genre, :description, :release_year
  validates_numericality_of :release_year, less_than_or_equal_to: Time.now.year + 1
  validates_uniqueness_of :title, {scope: :artist, message: "is already taken by artist"}
  validates :release_year, uniqueness: {scope: :artist, message: "must be unique to the artist"}
  validates :description, three_words: true
  validates :title, three_words: {message: "testing testing must be more than 3 words"}

  belongs_to :genre
end
