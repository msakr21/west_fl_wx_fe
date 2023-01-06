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

    expect(page).to have_unchecked_field('car_table')
    expect(page).to have_unchecked_field('house_table')
    expect(page).to have_unchecked_field('pets_table')
    expect(page).to have_unchecked_field('kids_table')
  end

  xit 'fill in info and check applicable boxes,click submit, acct is created and i am taking to checklist page' do
    visit '/users/new'

    fill_in "First name:", with: "Milo"
    fill_in "Last name:", with: "Murphy"
    fill_in "Email:", with: "m&m@whatever.com"
    check('car_table')
    check('house_table')
    expect(page).to have_unchecked_field('pets_table')
    expect(page).to have_unchecked_field('kids_table')
    click_button "Submit"

    # expect(current_path).to eq(user_path(User.last))
    expect(User.last.first_name).to eq("Milo")
    expect(User.last.last_name).to eq("Murphy")
    expect(User.last.email).to eq("m&m@whatever.com")
    expect(User.last.plan_table).to eq(true)
    expect(User.last.car_table).to eq(true)
    expect(User.last.house_table).to eq(true)
    expect(User.last.prep_kit_table).to eq(true)
    expect(User.last.records_table).to eq(true)
    expect(User.last.pets_table).to eq(false)
    expect(User.last.kids_table).to eq(false)
  end
end