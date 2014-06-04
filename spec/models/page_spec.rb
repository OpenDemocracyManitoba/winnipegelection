require 'spec_helper'

describe Page do
  context 'when class is augmented with FriendlyURL concern' do
    let(:page) { FactoryGirl.create(:page, permalink: 'Duck Soup') }

    it 'returns a friendly url path' do
      expect(page.friendly_path).to match %r"^/pages/\d+/duck-soup$"
    end

    it 'can find a page by id and slug' do
      found_page = Page.friendly_find(id: page.id, slug: 'duck-soup')
      expect(found_page).to be_a Page
    end

    it 'raises an error when finding a page when slug is incorrect or missing' do
      expect { Page.friendly_find(id: person.id, slug: 'wrong-slug') }.to raise_error
      expect { Page.friendly_find(id: person.id) }.to raise_error
    end
  end

end
