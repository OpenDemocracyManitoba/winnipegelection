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

  context 'when a region has two children' do
    let(:region) { FactoryGirl.create(:region_with_children, child_count: 2) }
    subject      { region.sub_regions }
    its(:count)  { is_expected.to eq(2) }
  end
end
