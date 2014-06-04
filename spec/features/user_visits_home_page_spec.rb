require 'spec_helper'

feature 'User visits the home page' do
  fixtures :elections

  scenario 'the page is successfully rendered' do
    visit "/"
    expect(page.status_code).to be(200)
  end

  scenario 'they see the site header' do
    visit "/"
    expect(page).to have_css('header h1', text: '2014 Winnipeg Civic Election')
  end

  scenario 'they see the number of days until the election' do
    Timecop.freeze( Time.local(2014, 10, 1, 12, 0, 0) ) do
      visit "/"
      expect(page).to have_css('.days_until_election', text: '21 Days Until The Election')
    end
  end
end
