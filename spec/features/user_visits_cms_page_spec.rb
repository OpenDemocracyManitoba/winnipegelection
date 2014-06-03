require 'spec_helper'

feature 'User vists a CMS page' do
  given(:page_with_displayed_title) do
    FactoryGirl.create(:page, show_title: true)
  end

  scenario 'they see the page contents' do
    visit page_with_displayed_title.friendly_path
    expect(page).to have_content page_with_displayed_title.content
  end

  scenario 'they see the page title for pages with displayed titles' do
    visit page_with_displayed_title.friendly_path
    expect(page).to have_content page_with_displayed_title.title
  end

  given(:page_without_displayed_title) do
    FactoryGirl.create(:page, show_title: false)
  end

  scenario 'they do not see the page title for pages with displayed titles' do
    visit page_without_displayed_title.friendly_path
    expect(page).to_not have_content page_without_displayed_title.title
  end
end
