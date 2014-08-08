require 'spec_helper'

feature 'User interacts with navigation menu' do
  before(:each) do
    visit '/'
  end

  context 'without existing NavigationHeading records' do
    before(:each) do
      NavigationHeading.destroy_all
      visit '/'
    end

    scenario 'they see no navigation menu' do
      expect(page).to_not have_css('nav.menu-holder')
    end
  end

  context 'with existing NavigationHeading records' do
    given(:home_nav_heading) { navigation_headings(:home) }
    given(:candidates_nav_heading) { navigation_headings(:candidates) }
    given(:about_nav_heading) { navigation_headings(:about) }

    given(:about_page) { pages(:about) }

    given(:city_of_winnipeg_2014_election_race) {
      electoral_races(:city_of_winnipeg_2014_election_race)
    }

    given(:st_vital_2014_election_race) {
      electoral_races(:st_vital_2014_election_race)
    }

    given(:mayoral_sub_heading) { navigation_headings(:mayoral_candidates) }

    scenario 'they see navigation menu' do
      expect(page).to have_css('nav.menu-holder')
    end

    scenario 'they see a top-level navigation link for each NavigationHeading' do
      within('nav.menu-holder') do
        selector = '.menu > ul.primary > li > a'
        expect(page).to have_css(selector, text: home_nav_heading.name)
        expect(page).to have_css(selector, text: candidates_nav_heading.name)
        expect(page).to have_css(selector, text: about_nav_heading.name)
      end
    end

    scenario 'they see list of all associated items in subnavs' do
      within('nav.menu-holder') do
        selector = '.menu > ul.primary > li.has-sub > ul.secondary > li > a'
        expect(page).to have_css(selector, text: about_page.title)
        expect(page).to have_css(selector,
                                 text: city_of_winnipeg_2014_election_race.name)
        expect(page).to have_css(selector,
                                 text: st_vital_2014_election_race.name)
        expect(page).to have_css(selector, text: mayoral_sub_heading.name)
      end
    end

    scenario 'they can navigate to Home page by clicking the navigation link "Home"' do
      within('nav.menu-holder') { click_link('Home') }
      expect(page.status_code).to be(200)
    end

    scenario ' they can navigate to a url via a sub-heading' do
      within('nav.menu-holder') { click_link('Council') }
      expect(page.status_code).to be(200)
    end

    scenario 'they can navigate to a CMS page by clicking a sub-navigation link' do
      within('nav.menu-holder') { click_link('About Us') }
      expect(page.status_code).to be(200)
      expect(page).to have_css('#main h1', text: about_page.title)
    end
  end
end
