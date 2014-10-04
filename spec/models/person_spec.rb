require 'spec_helper'
require 'concerns/friendly_url_spec'

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

  context 'when class is augmented with FriendlyURL concern' do
    it_behaves_like FriendlyURL do
      let(:object_of_described_class) do
        FactoryGirl.create(:person, name: 'Test Slug')
      end
      let(:test_slug) { 'test-slug' }
    end

    let(:person) { FactoryGirl.create(:person, name: 'Walter Glutton') }

    it 'returns a friendly url path' do
      expect(person.friendly_path).to match %r{^/people/\d+/walter-glutton$}
    end
  end

  context 'when a Person has election history' do
    describe '#most_recent_candidacy' do
      let(:person) { people(:darth_vadar) }
      let(:candidacy) { candidacies(:darth_vadar_mayoral_2014) }

      it 'returns the most recent candidacy for this Person' do
        expect(person.most_recent_candidacy).to eq(candidacy)
      end
    end

    describe '#most_recent_election' do
      let(:person) { people(:darth_vadar) }
      let(:election) { elections(:winnipeg_2014_election) }

      it 'returns the most recent Election this Person ran in' do
        expect(person.most_recent_election).to eq(election)
      end
    end

  end

  context 'when a Person has news mentions' do
    let(:darth) { people(:darth_vadar) }

    describe 'associated news mentions and news articles' do
      it 'differentiates between all news articles and approved articles' do
        approved_articles = darth.approved_news_articles
        all_articles = darth.news_articles
        expect(all_articles.count).to be > (approved_articles.count)
      end
    end

    describe '#updated_at_including_news_mentions' do
      it 'returns the updated at date of the most recent news mention' do
        FactoryGirl.create(:news_mention,
                           person: darth,
                           news_article: FactoryGirl.create(:news_article))
        most_recent_mention = NewsMention.last
        timestamp = darth.updated_at_including_news_mentions
        expect(timestamp).to eq(most_recent_mention.updated_at)
      end
    end
  end

  context 'when a Person has no news mentions' do
    let(:tyrion) { people(:tyrion_lannister) }

    describe '#updated_at_including_news_mentions' do
      it 'returns the updated at timestamp of the Person' do
        expect(tyrion.updated_at_including_news_mentions).to eq(tyrion.updated_at)
      end
    end
  end
end
