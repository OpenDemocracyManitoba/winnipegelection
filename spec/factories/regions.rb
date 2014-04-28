FactoryGirl.define do
  factory :region do
    name 'Winnipeg'
    start_date Date.today

    factory :region_with_parent do
      association :parent_region, factory: :region
    end

    factory :region_with_children do
      ignore do
        child_count 5
      end

      after(:create) do |instance, evaluator|
        create_list(:region, evaluator.child_count, parent_region: instance)
      end
    end
  end
end
