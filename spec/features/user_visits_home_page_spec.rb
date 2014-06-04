require 'spec_helper'

feature 'User visits the home page' do
  fixtures :elections

  background do
    visit "/"
  end

  scenario 'the page is successfully rendered' do
    expect(page.status_code).to be(200)
  end

  scenario 'they see the site header' do
    expect(page).to have_css('header h1', text: '2014 Winnipeg Civic Election')
  end

  scenario 'they see the number of days until the election' do
    expect(page).to have_css('.days_until_election', text: /\d+ Days Until The Election/)
  end
end
