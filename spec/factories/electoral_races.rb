FactoryGirl.define do
  factory :electoral_race do
    factory :electoral_race_with_region_and_election do
      region
      election
    end
  end
end
