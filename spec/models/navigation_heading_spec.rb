require 'spec_helper'

describe NavigationHeading do
  context 'when item is a parent heading' do
    let(:heading) { navigation_headings(:candidates) }
    let(:parent_heading) { navigation_headings(:about) }

    it 'is invalid if assigned a parent heading' do
      heading.parent_heading = parent_heading
      expect(heading).to be_invalid
    end
  end

  context 'when item is a sub-heading' do
    let(:heading) { navigation_headings(:mayoral_candidates) }
    let(:sub_heading) { navigation_headings(:council_candidates) }

    it 'is invalid if the url is missing' do
      heading.url = nil
      expect(heading).to be_invalid
    end

    it 'is invalid if assigned a sub-heading as a parent' do
      heading.parent_heading = sub_heading
      expect(heading).to be_invalid
    end
  end
end
