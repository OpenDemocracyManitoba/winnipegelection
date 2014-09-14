require 'spec_helper'

feature 'User visits a Person page' do
  context 'Any Person' do
    given(:darth_vadar) do
      people(:darth_vadar)
    end

    before(:each) do
      visit darth_vadar.friendly_path
    end

    scenario 'the page successfully loads' do
      expect(page.status_code).to be(200)
    end

    scenario "they see the person's name" do
      expect(page).to have_content(darth_vadar.name)
    end

    scenario "they see the person's name in the browser title" do
      expect(page).to have_title(darth_vadar.name)
    end
  end

  context 'Person is part of the active election' do
    given(:darth_vadar) do
      people(:darth_vadar)
    end

    before(:each) do
      visit darth_vadar.friendly_path
    end

    scenario 'they do not see a warning if the person is in active election' do
      expect(page).to_not have_content('information on this page was collected')
    end

    scenario 'they see the name of the active electoral race' do
      expect(page).to have_content('2014 City of Winnipeg Mayoral race')
    end

    scenario 'they can navigate to the active electoral race' do
      click_link('2014 City of Winnipeg Mayoral race')
      expect(page).to have_title('Mayoral: City of Winnipeg - 2014')
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

  context 'Person with questionnaire' do
    given(:darth_vadar) do
      people(:darth_vadar)
    end

    scenario 'they see questionnaire if a person has replied' do
      visit darth_vadar.friendly_path
      expect(page).to have_css('h2', text: 'Questionnaire Response')
    end
  end

  context 'Person without questionnaire' do
    given(:luke_skywalker) do
      people(:luke_skywalker)
    end

    scenario 'they do not see questionnaire if a person has not replied' do
      visit luke_skywalker.friendly_path
      expect(page).to_not have_css('h2', text: 'Questionnaire Response')
    end
  end

  context 'Person with related NewsMentions' do
    given(:darth_vadar) do
      people(:darth_vadar)
    end

    before(:each) do
      visit darth_vadar.friendly_path
    end

    scenario 'they see the correct related articles link' do
      expect(page).to have_content('2 Related Articles')
    end

    scenario 'they see the correct number of news articles' do
      expect(page.all(:css, '.news_article').size).to eq(2)
    end

    scenario 'they can see news article titles' do
      article = news_articles(:vadar_alone_in_mayoral_race)
      expect(page).to have_content(article.title)
    end
  end

  context 'Person with no NewsMentions' do
    given(:tyrion_lannister) do
      people(:tyrion_lannister)
    end

    scenario 'they see a message about no news articles' do
      visit tyrion_lannister.friendly_path
      expect(page).to have_content('No related news articles found.')
    end
  end
end
