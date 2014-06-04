require 'spec_helper'

feature 'User visits the home page' do
  fixtures :elections

  scenario 'the page is successfully rendered' do
    visit "/"
    expect(page.status_code).to be(200)
  end

  scenario 'they see the site header' do
    visit "/"
    expect(page).to have_content '2014 Winnipeg Civic Election'
  end
end
