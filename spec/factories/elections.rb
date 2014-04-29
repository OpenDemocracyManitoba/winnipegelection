# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :election do
    name '20XX Election'

    factory :election_with_electoral_races do
      ignore do
        electoral_race_count 5
      end

      after(:create) do |instance, evaluator|
        create_list(:electoral_race_with_region_and_election,
                    evaluator.electoral_race_count,
                    election: instance)
      end
    end
  end
end
