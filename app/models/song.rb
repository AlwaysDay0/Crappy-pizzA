class Song < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'associations', dependent: :delete_all
  has_and_belongs_to_many :artists, join_table: 'associations', dependent: :delete_all

  validates :title, presence: true
  validates :duration, presence: false
  validates :rating, presence: false
  va