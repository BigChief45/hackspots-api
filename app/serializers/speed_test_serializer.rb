class SpeedTestSerializer < ActiveModel::Serializer
  attributes :id, :download_speed, :upload_speed, :ping, :grade, :isp
  has_one :spot
end
