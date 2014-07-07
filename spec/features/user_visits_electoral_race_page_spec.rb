require 'spec_helper'

feature 'User visits an Electoral Race page' do
  context 'for any electoral race' do
    before(:each) do
      visit city_of_winnipeg_2014.friendly_path
    end

    given(:city_of_winnipeg_2014) do
      electoral_races(:city_of_winnipeg_2014_election_race)
    end

    scenario 'the page successfully loads' do
      expect(page.status_code).to be(200)
    end

    scenario 'they see the electoral race name' do
      expect(page).to have_content(city_of_winnipeg_2014.name)
    end
  end

  context 'for an electoral race with candidacies' do
    before(:each) do
      visit city_of_winnipeg_2014.friendly_path
    end

    given(:city_of_winnipeg_2014) do
      electoral_races(:city_of_winnipeg_2014_election_race)
    end
    given(:mayoral_person) { people(:darth_vadar) }

    scenario 'they see the correct number of mayoral candidates' do
      candidate_cards = page.all('.candidate-card')
      active_candidates = 2
      expect(candidate_cards.count).to eq(active_candidates)
    end

    scenario 'they can read a name from a candidate card link' do
      expect(page).to have_css('a.candidate',
                               text: mayoral_person.name)
    end

    scenario 'they can navigate to a person page' do
      click_link(mayoral_person.name)
      expect(page).to have_content(mayoral_person.name)
    end
  end

  context 'for an electoral race without candidacies' do
    pending
    before(:each) do
      visit electoral_race.friendly_path
    end

    given(:electoral_race) do
      electoral_races(:point_douglas_2014_election_race)
    end

    scenario 'they see a no-candidates-registered message' do
      expect(page).to have_content('no registered candidates')
    end
  end
end
