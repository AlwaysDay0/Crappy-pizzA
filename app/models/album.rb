
class Album < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'
  
  validates :title, presence: true
  validates :rating, presence: false

  accepts_nested_attributes_for :songs
  accepts_nested_attributes_for :artists

  def self.search(search_title)
    self.where("title LIKE ?", "%#{search_title}%")
  end
  
end