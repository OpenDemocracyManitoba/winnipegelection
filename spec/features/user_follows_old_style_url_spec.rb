require 'spec_helper'

feature 'User follows a 2010-era candidate URL' do
  context 'Visiting a candidate URL directly' do
    before(:each) do
      visit '/candidate/Darth_Vadar'
    end

    scenario 'the page is successfully fetched' do
      expect(page.status_code).to be(200)
    end

    scenario 'the user is redirected to the new-style friendly path' do
      darth = people(:darth_vadar)
      expect(current_path).to eq(darth.friendly_path)
    end

    scenario 'the user has arrived at the correct page' do
      expect(page).to have_content('Darth Vadar')
    end
  end

  context 'Visiting a candidate URL with pagination' do
    before(:each) do
      visit 'pages/5/candidate/Darth_Vadar'
    end

    scenario 'the page is successfully fetched' do
      expect(page.status_code).to be(200)
    end

    scenario 'the user is redirected to the new-style friendly path' do
      darth = people(:darth_vadar)
      expect(current_path).to eq(darth.friendly_path)
    end

    scenario 'the user has arrived at the correct page' do
      expect(page).to have_content('Darth Vadar')
    end
  end
end
