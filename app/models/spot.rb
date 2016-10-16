class Spot < ApplicationRecord
  
  validates :name, :description, :country, :city, :address, :latitude, :longitude, :open_hours, :wifi, :power, presence: true
  
  has_many :speed_tests, dependent: :destroy
  
end
