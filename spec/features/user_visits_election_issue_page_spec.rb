require 'spec_helper'

feature 'User visits election issue page' do
  context 'when they start on the home page' do
    before(:each) do
      visit '/'
    end

    scenario 'they see the election issue link in the navigation' do
      within('nav') do
        expect(page).to have_css('a', text: 'Election Issues')
      end
    end

    scenario 'they are able to navigate to the Election Issues Websites page' do
      find(:css, "a:contains('Election Issues')").click
      expect(page.status_code).to be(200)
      expect(page).to have_css('h1', text: 'Election Issue Websites')
    end
  end

  context 'On they are on the Issue Websites page' do
    scenario 'they are able to see issue websites for the current election' do
      visit issue_websites_path
      expect(page).to have_css('ul#issue_websites a', text: 'Hot Potato 2014')
    end
  end
end
