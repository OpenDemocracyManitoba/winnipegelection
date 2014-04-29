require 'spec_helper'

describe Candidacy do
  context 'when it has an associated person and electoral_race' do
    let(:candidacy) do
      FactoryGirl.build(:candidacy_with_person_and_electoral_race)
    end
    subject              { candidacy }
    its(:person)         { is_expected.to be_a(Person) }
    its(:electoral_race) { is_expected.to be_an(ElectoralRace) }
    it                   { is_expected.to be_valid }
  end

  context 'when it has no associated person or electoral_race' do
    let(:candidacy) { FactoryGirl.build(:candidacy) }
    subject         { candidacy }
    it              { is_expected.to_not be_valid }
  end
end
