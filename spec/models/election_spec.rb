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
        Timecop.freeze( Time.local(2014, 10, 1, 12, 0, 0) ) do
          expect(election.days_until_election).to eq(21)
        end
      end
    end

    describe '#has_already_occured?' do
      it 'is false if election has not yet come' do
        Timecop.freeze( Time.local(2014, 10, 1, 12, 0, 0) ) do
          expect(election.has_already_occured?).to eq(false)
        end
      end
      
      it 'is true if election has come and gone' do
        Timecop.freeze( Time.local(2014, 10, 23, 12, 0, 0) ) do
          expect(election.has_already_occured?).to eq(true)
        end
      end
    end

    describe '#is_today?' do
      it 'is false if the election is not today' do
        Timecop.freeze( Time.local(2014, 10, 1, 12, 0, 0) ) do
          expect(election.is_today?).to eq(false)
        end
      end

      it 'is true if the election is today' do
        Timecop.freeze( Time.local(2014, 10, 22, 12, 0, 0) ) do
          expect(election.is_today?).to eq(true)
        end
      end
    end
  end
end
