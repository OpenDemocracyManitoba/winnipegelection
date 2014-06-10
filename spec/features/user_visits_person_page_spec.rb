require 'spec_helper'

feature 'User visits a Person page' do
  given(:darth_vadar) do
    people(:darth_vadar)
  end

  scenario 'the page successfully loads' do
    visit darth_vadar.friendly_path
    expect(page.status_code).to be(200)
  end

  scenario "they see the person's name" do
    visit darth_vadar.friendly_path
    expect(page).to have_content(darth_vadar.name)
  end
end
