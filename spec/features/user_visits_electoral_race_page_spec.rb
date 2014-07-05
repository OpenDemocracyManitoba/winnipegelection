require 'spec_helper'

feature 'User visits an Electoral Race page' do
  given(:city_of_winnipeg_2014) do
    electoral_races(:city_of_winnipeg_2014_election_race)
  end
  given(:mayoral_person) { people(:darth_vadar) }

  scenario 'the page successfully loads' do
    visit city_of_winnipeg_2014.friendly_path
    expect(page.status_code).to be(200)
  end

  scenario 'they see the electoral race name' do
    visit city_of_winnipeg_2014.friendly_path
    expect(page).to have_content(city_of_winnipeg_2014.name)
  end

  scenario 'they see the mayoral candidates for the active election' do
    visit city_of_winnipeg_2014.friendly_path
    candidate_cards = page.all('.candidate-card')
    active_candidates = 2
    expect(candidate_cards.count).to eq(active_candidates)
  end

  scenario 'they can read a name from a candidate card link' do
    visit city_of_winnipeg_2014.friendly_path
    expect(page).to have_css('a.candidate',
                             text: mayoral_person.name)
  end

  scenario 'they can navigate to a person page' do
    visit city_of_winnipeg_2014.friendly_path
    click_link(mayoral_person.name)
    expect(page).to have_content(mayoral_person.name)
  end

end
