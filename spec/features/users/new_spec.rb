require 'rails_helper'

RSpec.describe 'new user form page' do
  it 'has fields for first name, last name, and email' do
    visit '/'
    click_link 'Register'

    expect(current_path).to eq('/users/new')
    expect(page).to have_content("First name:")
    expect(page).to have_field("First name:")

    expect(page).to have_content("Last name:")
    expect(page).to have_field("Last name:")

    expect(page).to have_content("Email:")
    expect(page).to have_field("Email:")
  end

  it 'has checkboxes for plan,car,house, prep kit, records, pets and kids,' do
    visit '/users/new'

    expect(page).to have_unchecked_field('plan')
    expect(page).to have_unchecked_field('car')
    expect(page).to have_unchecked_field('house')
    expect(page).to have_unchecked_field('prep kits')
    expect(page).to have_unchecked_field('records')
    expect(page).to have_unchecked_field('pets')
    expect(page).to have_unchecked_field('kids')
  end
  xit 'fill in info and check applicable boxes,click submit, acct is created and i am taking to checklist page' do
    visit '/users/new'

    expect(page).to have_checked_field('plan')
    expect(page).to have_checked_field('car')
    expect(page).to have_checked_field('house')
    expect(page).to have_unchecked_field('prep kits')
    expect(page).to have_unchecked_field('records')
    expect(page).to have_unchecked_field('pets')
    expect(page).to have_unchecked_field('kids')
    #click_button "Submit"
    # expect(current_path).to eq('/users/show')
    #expect(page).to have_content
  end
end