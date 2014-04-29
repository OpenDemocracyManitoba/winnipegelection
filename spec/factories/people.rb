FactoryGirl.define do
  factory :person do
    name 'Wally Glutton'

    factory :person_with_candidacies do
      ignore do
        candidacy_count 5
      end

      after(:create) do |instance, evaluator|
        create_list(:candidacy_with_person_and_electoral_race,
                    evaluator.candidacy_count,
                    person: instance)
      end
    end
  end
end
