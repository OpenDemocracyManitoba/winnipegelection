require 'spec_helper'

describe Region do
  context 'when a region has no children' do
    let(:region) { FactoryGirl.build(:region) }
    subject      { region.sub_regions }
    it           { is_expected.to be_empty }
  end

  context 'when a region is a sub-region' do
    let(:region) { FactoryGirl.build(:region_with_parent) }
    subject      { region.parent_region }
    it           { is_expected.to_not be_nil }
  end

  context 'when a region has children regions' do
    let(:region) do
      FactoryGirl.create(:region_with_children, child_count: ASSOCIATION_COUNT)
    end
    subject            { region }
    its(:sub_regions)  { is_expected.to have(ASSOCIATION_COUNT).items }
  end

  context 'when a region has electoral races' do
    let(:region) do
      FactoryGirl.create(:region_with_electoral_races,
                         electoral_race_count: ASSOCIATION_COUNT)
    end
    subject                { region }
    its(:electoral_races)  { is_expected.to have(ASSOCIATION_COUNT).items }
    its(:elections)        { is_expected.to have(ASSOCIATION_COUNT).items }
  end
end
