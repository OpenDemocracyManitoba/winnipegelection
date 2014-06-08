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

    context 'MVH - Minimum Viable Homepage' do
      scenario 'they see the mayoral candidates for the active election' do
      end

      scenario 'they can navigate to a candidates page' do
      end

      scenario 'they see a listing of CMS pages' do
      end

      scenario 'they can nvaigate to a CMS page' do
      end
    end

    after(:all) do
      Timecop.return
    end
  end
end
