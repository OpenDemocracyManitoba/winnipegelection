require 'spec_helper'

describe Page do
  context 'when class is augmented with FriendlyURL concern' do
    it_behaves_like FriendlyURL do
      let(:object_of_described_class) do
        FactoryGirl.create(:page, permalink: 'Test Slug')
      end
    end

    let(:page) { FactoryGirl.create(:page, permalink: 'Duck Soup') }

    it 'returns a friendly url path' do
      expect(page.friendly_path).to match %r{^/pages/\d+/duck-soup$}
    end
  end
end
