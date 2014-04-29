require 'spec_helper'

describe Person do
  context 'when a person has candidaces' do
    let(:person) do
      FactoryGirl.create(:person_with_candidacies,
                         candidacy_count: ASSOCIATION_COUNT)
    end
    subject               { person }
    its(:candidacies)     { is_expected.to have(ASSOCIATION_COUNT).items }
    its(:electoral_races) { is_expected.to have(ASSOCIATION_COUNT).items }
  end
end
