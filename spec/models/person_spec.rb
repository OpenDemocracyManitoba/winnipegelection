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

  context 'when class is augmented with FriendlyURL concern' do
    it_behaves_like FriendlyURL do
      let(:object_of_described_class) do
        FactoryGirl.create(:person, name: 'Test Slug')
      end
    end

    let(:person) { FactoryGirl.create(:person, name: 'Walter Glutton') }

    it 'returns a friendly url path' do
      expect(person.friendly_path).to match %r{^/people/\d+/walter-glutton$}
    end
  end
end
