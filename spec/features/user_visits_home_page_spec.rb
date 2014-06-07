require 'spec_helper'

feature 'User visits the home page' do
  scenario 'the page is successfully rendered' do
    visit '/'
    expect(page.status_code).to be(200)
  end

  scenario 'they see the name of the most recent, active Election' do
    visit '/'
    expect(page).to have_css('header h1', text: '2014 Winnipeg Civic Election')
  end

  context 'before the active election has occured' do
    before(:all) do
      Timecop.freeze(Time.local(2014, 10, 1, 12, 0, 0))
    end

    scenario 'they see the number of days until the election' do
      visit '/'
      expect(page).to have_css('.days_until_election',
                               text: /\d+ Days Until The Election/)
    end

    scenario 'they see the names of electoral races for the active election' do
      visit '/'
      electoral_races_on_page = page.all('.electoral_race')
      expect(electoral_races_on_page.count).to eq(5)
    end

    after(:all) do
      Timecop.return
    end
  end
end
