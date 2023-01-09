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
    test_user = User.create(id: 10, first_name: 'Mufasa', last_name: 'Skar', email: 'mskar@whatever.com')

    visit edit_user_path(test_user)
    expect(current_path).to eq('/')

    visit user_path(test_user)
    expect(current_path).to eq('/')
  end
end