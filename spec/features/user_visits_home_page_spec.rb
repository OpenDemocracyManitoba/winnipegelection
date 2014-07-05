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
    given(:first_page) { Page.first }

    scenario 'they see the correct number of CMS page links' do
      cms_page_links = page.all('a.cms-page')
      expect(cms_page_links.count).to eq(3)
    end

    scenario 'they can read a title from a cms page link' do
      expect(page).to have_css('a.cms-page', text: first_page.title)
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
      expect(page).to have_css('.days-until-election',
                               text: /Until the Election/)
      expect(page).to have_css('.days', text: /\d+ Days/)
    end

    context 'MVH - Minimum Viable Homepage' do
      scenario 'they see a link to mayoral candidates' do
        expect(page).to have_css('a', text: 'Mayoral Candidates')
      end

      scenario 'they can navigate to the mayoral candidates page' do
        click_link('Mayoral Candidates')
        mayoral_race = electoral_races(:city_of_winnipeg_2014_election_race)
        expect(page).to have_content(mayoral_race.name)
      end
    end

    after(:all) do
      Timecop.return
    end
  end
end
