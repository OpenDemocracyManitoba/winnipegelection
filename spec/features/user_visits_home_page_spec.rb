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

  scenario 'they can navigate to the all council candidates page' do
    click_link('Council Candidates')
    actual_race_names = [electoral_races(:point_douglas_2014_election_race).name,
                         electoral_races(:st_vital_2014_election_race).name]
    races = all('h2').map { |e| e.text }
    expect(races).to eq(actual_race_names)
  end

  scenario 'they can navigate to the all trustee caniddates page' do
    click_link('Trustee Candidates')
    actual_race_names = [electoral_races(:ward_1_louis_reil_2014_election_race).name,
                         electoral_races(:ward_2_louis_reil_2014_election_race).name]
    races = all('h2').map { |e| e.text }
    expect(races).to eq(actual_race_names)
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
end
