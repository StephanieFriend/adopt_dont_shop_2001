class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex, :shelter
  belongs_to :shelter

  def self.pet_count
    count
  end
end