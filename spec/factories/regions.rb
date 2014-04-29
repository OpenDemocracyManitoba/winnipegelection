FactoryGirl.define do
  factory :region do
    name 'Winnipeg'
    region_type

    factory :region_with_parent do
      association :parent_region, factory: :region
    end

    factory :region_with_children do
      ignore do
        child_count 1
      end

      after(:create) do |instance, evaluator|
        create_list(:region, evaluator.child_count, parent_region: instance)
      end
    end

    factory :region_with_electoral_races do
      ignore do
        electoral_race_count 1
      end

      after(:create) do |instance, evaluator|
        create_list(:electoral_race_with_region_and_election,
                    evaluator.electoral_race_count,
                    region: instance)
      end
    end

    factory :region_with_candidacy_through_electoral_race do
      after(:create) do |instance|
        create(:electoral_race_with_candidacies, region: instance)
      end
    end
  end
end
