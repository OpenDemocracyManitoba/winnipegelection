require 'spec_helper'

feature 'User visits the home page' do
  before(:each) do
    visit '/'
  end

  scenario 'the page is successfully rendered' do
    expect(page.status_code).to be(200)
  end

  scenario 'they see the name of the most recent, active Election' do
    expect(page).to have_css('header h1', text: '2014 Winnipeg Civic Election')
  end

  context 'interacting with CMS page links' do
    let(:first_page) { Page.first }

    scenario 'they see the correct number of CMS page links' do
      cms_page_links = page.all('a.cms_page')
      expect(cms_page_links.count).to eq(3)
    end

    scenario 'they can read a title from a cms page link' do
      expect(page).to have_css('a.cms_page', text: first_page.title)
    end

    scenario 'they can navigate to a CMS page' do
      click_link(first_page.title)
      expect(page.status_code).to be(200)
    end

    scenario 'they navigate to the correct CMS page' do
      click_link(first_page.title)
      expect(page).to have_content(first_page.title)
    end
  end

  context 'before the active election has occured' do
    before(:all) do
      Timecop.freeze(Time.local(2014, 10, 1, 12, 0, 0))
    end

    scenario 'they see the number of days until the election' do
      expect(page).to have_css('.days_until_election',
                               text: /\d+ Days Until The Election/)
    end

    context 'MVH - Minimum Viable Homepage' do
      scenario 'they see the mayoral candidates for the active election' do
      end

      scenario 'they can navigate to a candidates page' do
      end
    end

    after(:all) do
      Timecop.return
    end
  end
end
