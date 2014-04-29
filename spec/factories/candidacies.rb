FactoryGirl.define do
  factory :candidacy do
    factory :candidacy_with_person_and_electoral_race do
      person
      electoral_race factory: :electoral_race_with_region_and_election
    end
  end
end
