require 'spec_helper'

describe Election do
  context 'when an election has electoral races' do
    let(:election) do
      FactoryGirl.create(:election_with_electoral_races,
                         electoral_race_count: ASSOCIATION_COUNT)
    end
    subject { election }
    it      { is_expected.to have(ASSOCIATION_COUNT).electoral_races }
    it      { is_expected.to have(ASSOCIATION_COUNT).regions }
  end

  context 'when an election has a candidacy through an electoral race' do
    let(:election) do
      FactoryGirl.create(:election_with_candidacy_through_electoral_race)
    end
    subject { election }
    it      { is_expected.to have(1).candidacies }
  end

  context 'working with the election date' do
    let(:election) do
      FactoryGirl.create(:election, election_date: Date.parse('22 October 2014'))
    end

    describe '#days_until_election' do
      it 'should return the correct number of days' do
        allow(Date).to receive(:today) { Date.parse('1 October 2014') }
        expect(election.days_until_election).to eq(21)
      end
    end

    describe '#has_election_passed?' do
      it 'is false if election has not yet come' do
        allow(Date).to receive(:today) { Date.parse('1 October 2014') }
        expect(election.has_election_passed?).to eq(false)
      end
      
      it 'is true if election has come and gone' do
        allow(Date).to receive(:today) { Date.parse('23 October 2014') }
        expect(election.has_election_passed?).to eq(true)
      end
    end

    describe '#election_is_today?' do
      it 'is false if the election is not today' do
        allow(Date).to receive(:today) { Date.parse('21 October 2014') }
        expect(election.is_election_today?).to eq(false)
      end

      it 'is true if the election is today' do
        allow(Date).to receive(:today) { Date.parse('22 October 2014') }
        expect(election.is_election_today?).to eq(true)
      end
    end
  end
end
