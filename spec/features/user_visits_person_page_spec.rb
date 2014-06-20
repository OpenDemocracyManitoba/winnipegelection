require 'spec_helper'

feature 'User visits a Person page' do
  given(:darth_vadar) do
    people(:darth_vadar)
  end

  given(:luke_skywalker) do
    people(:luke_skywalker)
  end

  given(:tyrion_lannister) do
    people(:tyrion_lannister)
  end

  scenario 'the page successfully loads' do
    visit darth_vadar.friendly_path
    expect(page.status_code).to be(200)
  end

  scenario "they see the person's name" do
    visit darth_vadar.friendly_path
    expect(page).to have_content(darth_vadar.name)
  end

  scenario 'they see questionnaire if a person has replied' do
    visit darth_vadar.friendly_path
    expect(page).to have_css('h2', text: 'Questionnaire Response')
  end

  scenario 'they do not see questionnaire if a person has not replied' do
    visit luke_skywalker.friendly_path
    expect(page).to_not have_css('h2', text: 'Questionnaire Response')
  end

  scenario 'they see an warning if the person is not in active election' do
    visit tyrion_lannister.friendly_path
    expect(page).to have_content('Tyrion Lannister is not running')
  end

  scenario 'they do not see a warning if the person is in active election' do
    visit darth_vadar.friendly_path
    expect(page).to_not have_content('Darth Vadar is not running')
  end
end
