require 'spec_helper'

feature 'User visits a Person page' do

  context 'Person in active election with questionnaire' do
    before(:each) do
      visit darth_vadar.friendly_path
    end

    given(:darth_vadar) do
      people(:darth_vadar)
    end

    scenario 'the page successfully loads' do
      expect(page.status_code).to be(200)
    end

    scenario "they see the person's name" do
      expect(page).to have_content(darth_vadar.name)
    end

    scenario 'they see questionnaire if a person has replied' do
      expect(page).to have_css('h2', text: 'Questionnaire Response')
    end

    scenario 'they do not see a warning if the person is in active election' do
      visit darth_vadar.friendly_path
      expect(page).to_not have_content('information on this page was collected')
    end
  end

  context 'Person in active election without questionnaire' do
    given(:luke_skywalker) do
      people(:luke_skywalker)
    end

    scenario 'they do not see questionnaire if a person has not replied' do
      visit luke_skywalker.friendly_path
      expect(page).to_not have_css('h2', text: 'Questionnaire Response')
    end
  end

  context 'Person not running in active election' do
    given(:tyrion_lannister) do
      people(:tyrion_lannister)
    end

    scenario 'they see an warning if the person is not in active election' do
      visit tyrion_lannister.friendly_path
      expect(page).to have_content('information on this page was collected')
    end
  end

end
