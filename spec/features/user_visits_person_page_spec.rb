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

    scenario "they see the person's name in the browser title" do
      expect(page).to have_title(darth_vadar.name)
    end

    scenario 'they see questionnaire if a person has replied' do
      expect(page).to have_css('h2', text: 'Questionnaire Response')
    end

    scenario 'they do not see a warning if the person is in active election' do
      expect(page).to_not have_content('information on this page was collected')
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

  context 'Person in active election without questionnaire' do
    given(:luke_skywalker) do
      people(:luke_skywalker)
    end

    scenario 'they do not see questionnaire if a person has not replied' do
      visit luke_skywalker.friendly_path
      expect(page).to_not have_css('h2', text: 'Questionnaire Response')
    end
  end

  context 'Person not running in active election with no news mentions' do
    before(:each) do
      visit tyrion_lannister.friendly_path
    end

    given(:tyrion_lannister) do
      people(:tyrion_lannister)
    end

    scenario 'they see an warning if the person is not in active election' do
      expect(page).to have_content('information on this page was collected')
    end

    scenario 'they see a message about no news articles' do
      expect(page).to have_content('No related news articles found.')
    end
  end

end
