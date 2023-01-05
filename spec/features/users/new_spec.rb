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

    expect(page).to have_unchecked_field('car')
    expect(page).to have_unchecked_field('house')
    expect(page).to have_unchecked_field('pets')
    expect(page).to have_unchecked_field('kids')
  end

  it 'fill in info and check applicable boxes,click submit, acct is created and i am taking to checklist page' do
    visit '/users/new'

    fill_in "First name:", with: "Milo"
    fill_in "Last name:", with: "Murphy"
    fill_in "Email:", with: "m&m@whatever.com"
    check('car')
    check('house')
    expect(page).to have_unchecked_field('pets')
    expect(page).to have_unchecked_field('kids')
    click_button "Submit"

    expect(current_path).to eq('/users/show')
    expect(User.last.first_name).to eq("Milo")
    expect(User.last.last_name).to eq("Murphy")
    expect(User.last.email).to eq("m&m@whatever.com")
    expect(User.last.plan).to eq(true)
    expect(User.last.car).to eq(true)
    expect(User.last.house).to eq(true)
    expect(User.last.prep_kit).to eq(true)
    expect(User.last.records).to eq(true)
    expect(User.last.pets).to eq(false)
    expect(User.last.kids).to eq(false)
  end
end