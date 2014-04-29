require 'spec_helper'

describe ElectoralRace do
  context 'when it has an associated region and election' do
    let(:electoral_race) do
      FactoryGirl.build(:electoral_race_with_region_and_election)
    end
    subject        { electoral_race }
    its(:region)   { is_expected.to be_a(Region) }
    its(:election) { is_expected.to be_an(Election) }
    it             { is_expected.to be_valid }
  end

  context 'when it has no associated region or election' do
    let(:electoral_race) { FactoryGirl.build(:electoral_race) }
    subject              { electoral_race }
    it                   { is_expected.to_not be_valid }
  end

  context 'when it has associated candidacies' do
    let(:electoral_race) do
      FactoryGirl.create(:electoral_race_with_candidacies,
                         candidacy_count: ASSOCIATION_COUNT)
    end
    subject           { electoral_race }
    its(:candidacies) { is_expected.to have(ASSOCIATION_COUNT).items }
    its(:people)      { is_expected.to have(ASSOCIATION_COUNT).items }
  end
end
