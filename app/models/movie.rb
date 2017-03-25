class Movie < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :title, presence: true

  has_many :movie_relationships
  has_many :members, through: :movie_relationships, source: :user
end
