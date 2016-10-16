class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :country, :city, :address, :latitude, :longitude, :open_hours, :wifi, :power
end
