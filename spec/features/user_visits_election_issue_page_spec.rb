require 'spec_helper'

feature 'User visits election issue page' do
  context 'when navigating the Winnipeg Election website' do

    before(:each) do
      visit '/'
    end

    scenario 'they are able to click on a Voter Resources link to see the election issue link' do
      within('nav') do
        expect(page).to have_css('a', text: 'Election Issues')
      end
    end
  end

end