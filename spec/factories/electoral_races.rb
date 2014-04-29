FactoryGirl.define do
  factory :electoral_race do
    factory :electoral_race_with_region_and_election do
      region
      election

      factory :electoral_race_with_candidacies do
        ignore do
          candidacy_count 1
        end

        after(:create) do |instance, evaluator|
          create_list(:candidacy_with_person_and_electoral_race,
                      evaluator.candidacy_count,
                      electoral_race: instance)
        end
      end
    end
  end
end
