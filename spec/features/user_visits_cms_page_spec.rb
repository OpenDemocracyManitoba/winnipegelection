require 'spec_helper'

feature 'User visits a CMS page' do
  context 'for all CMS pages' do
    given(:cms_page) do
      FactoryGirl.create(:page, show_title: true)
    end

    before(:each) do
      visit cms_page.friendly_path
    end

    scenario 'they see the cms page contents' do
      expect(page).to have_content cms_page.content
    end

    scenario 'the browser tab title is set to the cms page title' do
      expect(page).to have_title(cms_page.title)
    end
  end

  context 'for a page with a displayed title' do
    given(:page_with_displayed_title) do
      FactoryGirl.create(:page, show_title: true)
    end

    before(:each) do
      visit page_with_displayed_title.friendly_path
    end

    scenario 'they see the page title header for pages with displayed titles' do
      expect(page).to have_content page_with_displayed_title.title
    end
  end

  context 'for a page without a displayed title' do
    given(:page_without_displayed_title) do
      FactoryGirl.create(:page, show_title: false)
    end

    scenario 'they do not see the title header for pages without displayed titles' do
      visit page_without_displayed_title.friendly_path
      expect(page).to_not have_content page_without_displayed_title.title
    end
  end
end
