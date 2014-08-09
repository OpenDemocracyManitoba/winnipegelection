require 'spec_helper'

feature 'User interacts with navigation menu' do
  context 'without existing NavigationHeading records' do
    scenario 'they see no navigation menu' do
      NavigationHeading.destroy_all
      visit '/'
      expect(page).to_not have_css('nav.menu-holder')
    end
  end

  context 'with existing NavigationHeading records' do
    before(:each) do
      visit '/'
    end

    given(:top_level_nav_link_selector) { '.menu > ul.primary > li > a' }
    given(:sub_nav_link_selector) {
      '.menu > ul.primary > li.has-sub > ul.secondary > li > a'
    }

    scenario 'they see navigation menu' do
      expect(page).to have_css('nav.menu-holder')
    end

    context 'with a top-level NavigationHeading record with a url' do
      given(:home_nav_heading) { navigation_headings(:home) }

      scenario 'they can navigate to a URL by way of the navigation link' do
        within('nav.menu-holder') { click_link('Home') }
        expect(page.status_code).to be(200)
      end

      scenario 'they see the top-level navigation link in the menu' do
        within('nav.menu-holder') do
          expect(page).to have_css(top_level_nav_link_selector,
                                   text: home_nav_heading.name)
        end
      end
    end

    context 'with a top-level NavigationHeading record without a url' do
      given(:about_nav_heading) { navigation_headings(:about) }

      scenario 'they see the top-level navigation link in the menu' do
        within('nav.menu-holder') do
          expect(page).to have_css(top_level_nav_link_selector,
                                   text: about_nav_heading.name)
        end
      end
    end

    context 'with a CMS page as a sub-navigation record' do
      given(:about_page) { pages(:about) }

      scenario 'they see the CMS page link as a sub-navigation link' do
        within('nav.menu-holder') do
          expect(page).to have_css(sub_nav_link_selector, text: about_page.title)
        end
      end

      scenario 'they can navigate to a CMS page by clicking a sub-navigation link' do
        within('nav.menu-holder') { click_link('About Us') }
        expect(page).to have_css('#main h1', text: about_page.title)
      end
    end

    context 'with a ElectoralRace as a sub-navigation record' do
      given(:electoral_race) {
        electoral_races(:city_of_winnipeg_2014_election_race)
      }

      scenario 'they see the ElectoralRace as a sub-navigation link' do
        within('nav.menu-holder') do
          expect(page).to have_css(sub_nav_link_selector, text: electoral_race.name)
        end
      end

      scenario 'they can navigate to an Electoral by clicking a sub-navigation link' do
        within('nav.menu-holder') { click_link(electoral_race.name) }
        expect(page).to have_css('#main h2', text: electoral_race.name)
      end
    end

    context 'with a NavigationHeading as a sub-navigation record' do
      given(:mayoral_sub_heading) { navigation_headings(:mayoral_candidates) }

      scenario 'they see the NavigationHeading as a sub-navigation link' do
        within('nav.menu-holder') do
          expect(page).to have_css(sub_nav_link_selector, text: mayoral_sub_heading.name)
        end
      end

      scenario ' they can navigate to a url via the sub-navigation link' do
        within('nav.menu-holder') { click_link('Council') }
        expect(page.status_code).to be(200)
      end
    end
  end
end
