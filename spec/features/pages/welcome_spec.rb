require 'rails_helper'

RSpec.describe 'Root page' do
  it 'has name of the app ' do
    visit '/'
    expect(page).to have_content('West FL WX')
  end

  it 'has a link to register new users ' do
    visit '/'
    expect(page).to have_link('Register')
  end

  it 'has a link for registered users to log in  ' do
    visit '/'
    expect(page).to have_link('Login')
  end
  
  it 'redirects to root page if user is not authenticated' do
    test_user = create(:user)

    visit edit_user_path(test_user)
    expect(current_path).to eq('/')
    expect(page).to have_content('You must be logged in to view this content')

    visit user_path(test_user)
    expect(current_path).to eq('/')
    expect(page).to have_content('You must be logged in to view this content')
  end
end