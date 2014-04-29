require 'spec_helper'

describe Person do
  context 'when a person has candidaces' do
    let(:person) do
      FactoryGirl.create(:person_with_candidacies,
                         candidacy_count: ASSOCIATION_COUNT)
    end
    subject { person }
    it      { is_expected.to have(ASSOCIATION_COUNT).candidacies }
    it      { is_expected.to have(ASSOCIATION_COUNT).electoral_races }
  end
end
