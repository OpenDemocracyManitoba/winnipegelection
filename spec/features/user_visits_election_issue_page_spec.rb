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

    scenario 'they are able to click on the Election Issues link to see the Election Issues Websites page' do
      find(:css, "a:contains('Election Issues')").click
      expect(page.status_code).to be(200)
      expect(page).to have_css('h1', text: 'Election Issue Websites')
    end

    scenario 'they are able to see issue website listings for the current election when they visit the election issue page' do
      find(:css, "a:contains('Election Issues')").click
      within('ul#issue_websites') do
        expect(page).to have_css('a', count: 1)
      end
    end
  end
end
