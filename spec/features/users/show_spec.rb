require 'rails_helper'

RSpec.describe 'Users show page' do
  it 'i can see link to check the weather at bottom corner' do
    visit ('/users/show')
    expect(page).to have_link("Check Weather")
  end

  it 'after i click on weather link, i get a flash message' do
    visit ('/users/show')
    expect(page).to have_link("Check Weather")
    click_link("Check Weather")
    expect(current_path).to eq('/users/show')
    expect(page).to have_content("Message:")
  end

  it 'also after i click on weather link,email is sent' do
    visit ('/users/show')
    expect(page).to have_link("Check Weather")
    click_link("Check Weather")
    expect(current_path).to eq('/users/show')
    #not sure how to test for email
  end
end