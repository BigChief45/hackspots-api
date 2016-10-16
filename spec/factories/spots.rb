FactoryGirl.define do
  factory :spot do
    name "Embaixado"
    description "Quiet cafe with nice music, empty upstairs, great salad, and cool dances at night."
    country "Portugal"
    city "Porto"
    address "Praça de Carlos Alberto 121, Porto, Portugal"
    latitude 1.5
    longitude 1.5
    open_hours "Mon 12:30pm - 1:00am, Tue-Sun 10:00am - 1:00am"
    wifi true
    power true
  end
end
