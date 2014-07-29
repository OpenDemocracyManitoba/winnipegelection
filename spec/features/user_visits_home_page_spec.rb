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

  scenario 'they see a link to mayoral candidates' do
    expect(page).to have_css('a', text: 'Mayoral Candidates')
  end

  scenario 'they can navigate to the mayoral candidates page' do
    click_link('Mayoral Candidates')
    mayoral_race = electoral_races(:city_of_winnipeg_2014_election_race)
    expect(page).to have_content(mayoral_race.name)
  end

  scenario 'they see a link to council candidates' do
    expect(page).to have_css('a', text: 'Council Candidates')
  end

  scenario 'they can navigate to the council candidates page' do
    click_link('Council Candidates')
    st_vital_race = electoral_races(:st_vital_2014_election_race)
    expect(page).to have_content(st_vital_race.name)
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

    after(:all) do
      Timecop.return
    end
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
      within('#main') { click_link(first_page.title) }
      expect(page.status_code).to be(200)
    end

    scenario 'they navigate to the correct CMS page' do
      within('#main') { click_link(first_page.title) }
      expect(page).to have_content(first_page.title)
    end
  end

  context 'interacting with navigation menu links' do
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

      given(:city_of_winnipeg_2014_election_race) { electoral_races(:city_of_winnipeg_2014_election_race) }
      given(:st_vital_2014_election_race) { electoral_races(:st_vital_2014_election_race) }

      scenario 'they see navigation menu' do
        expect(page).to have_css('nav.menu-holder')
      end

      scenario 'they see a top-level navigation link for each NavigationHeading record' do
        within('nav.menu-holder') do
          expect(page).to have_css('.menu > ul.primary > li > a', text: home_nav_heading.name)
          expect(page).to have_css('.menu > ul.primary > li > a', text: candidates_nav_heading.name)
          expect(page).to have_css('.menu > ul.primary > li > a', text: about_nav_heading.name)
        end
      end

      scenario 'they see list of all associated items in subnavs' do
        within('nav.menu-holder') do
          expect(page).to have_css('.menu > ul.primary > li.has-sub > ul.secondary > li > a', text: about_page.title)
          expect(page).to have_css('.menu > ul.primary > li.has-sub > ul.secondary > li > a', text: city_of_winnipeg_2014_election_race.name)
          expect(page).to have_css('.menu > ul.primary > li.has-sub > ul.secondary > li > a', text: st_vital_2014_election_race.name)
        end
      end

      scenario 'they can navigate to Home page by clicking a top-level navigation link "Home"' do
        within('nav.menu-holder') { click_link('Home') }
        expect(page.status_code).to be(200)
      end

      scenario 'they can navigate to About Us page by clicking a sub-navigation link "About Us"' do
        within('nav.menu-holder') { click_link('About Us') }
        expect(page.status_code).to be(200)
        expect(page).to have_css('#main h1', text: about_page.title)
      end
    end
  end
end
