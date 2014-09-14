require 'spec_helper'
require 'concerns/friendly_url_spec'

describe Page do

  it 'aliases active record all to cms_pages.' do
    expect(Page.cms_pages.count).to eq(3)
  end

  context 'when class is augmented with FriendlyURL concern' do
    it_behaves_like FriendlyURL do
      let(:object_of_described_class) do
        FactoryGirl.create(:page, title: 'Test Slug')
      end
      let(:test_slug) { 'test-slug' }
    end

    let(:page) { FactoryGirl.create(:page, title: 'Duck Soup') }

    it 'returns a friendly url path' do
      expect(page.friendly_path).to match %r{^/pages/\d+/duck-soup$}
    end
  end
end
