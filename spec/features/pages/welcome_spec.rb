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
end