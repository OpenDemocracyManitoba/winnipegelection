require 'spec_helper'

describe Candidacy do
  context 'when a candidacy has an associated person and electoral_race' do
    let(:candidacy) do
      FactoryGirl.build(:candidacy_with_person_and_electoral_race)
    end
    subject              { candidacy }
    it                   { is_expected.to be_valid }
    
    it 'has accessible associations of the correct type' do
      expect(candidacy.person).to be_a(Person)
      expect(candidacy.electoral_race).to be_a(ElectoralRace)
    end
  end

  context 'when a candidacy has no associated person or electoral_race' do
    let(:candidacy) { FactoryGirl.build(:candidacy) }
    subject         { candidacy }
    it              { is_expected.to_not be_valid }
  end
end
