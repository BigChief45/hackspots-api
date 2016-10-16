FactoryGirl.define do
  factory :speed_test do
    download_speed "34.60"
    upload_speed "46.33"
    ping 5
    grade "B"
    isp "Orange"
    spot { FactoryGirl.create(:spot) }
  end
end
