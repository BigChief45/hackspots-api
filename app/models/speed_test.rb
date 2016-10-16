class SpeedTest < ApplicationRecord
  
  validates :download_speed, :upload_speed, :ping, :grade, :isp, :spot, presence: true
  
  belongs_to :spot
end
