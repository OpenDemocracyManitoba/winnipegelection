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
    let(:person) { FactoryGirl.create(:person, name: 'Walter Glutton') }

    it 'returns a friendly url path' do
      expect(person.friendly_path).to match %r"^/people/\d+/walter-glutton$"
    end

    it 'can find a person by id and slug' do
      found_person = Person.friendly_find(id: person.id, slug: 'walter-glutton')
      expect(found_person).to be_a Person
    end

    it 'raises an error when finding a person when slug is incorrect or missing' do
      expect { Person.friendly_find(id: person.id, slug: 'wrong-slug') }.to raise_error
      expect { Person.friendly_find(id: person.id) }.to raise_error
    end
  end
end
