require 'rails_helper'

RSpec.describe 'edit form page' do
  before :each do
    @test_user = create(:user)
    allow(User).to receive(:current_user_by_with_conditional).and_return(@test_user)
    allow(User).to receive(:current_user_by).and_return(@test_user)
  end

  it 'has fields for first name, last name, and email' do
    visit "/users/#{@test_user.id}/edit"
    save_and_open_page
    expect(page).to have_content('First name:')
    expect(page).to have_field('First name:')
    expect(page).to have_content('Last name:')
    expect(page).to have_field('Last name:')
    expect(page).to have_content('Email:')
    expect(page).to have_field('Email:')
  end

  it 'has checkboxes for plan,car,house, prep kit, records, pets and kids,' do
    visit "/users/#{@test_user.id}/edit"

    expect(page).to have_unchecked_field('car_table')
    expect(page).to have_unchecked_field('house_table')
    expect(page).to have_unchecked_field('pets_table')
    expect(page).to have_unchecked_field('kids_table')
  end

  it 'fill in info and check applicable boxes,click submit, acct is created and i am taking to checklist page' do
    visit "/users/#{@test_user.id}/edit"

    check('car_table')
    check('house_table')
    expect(page).to have_unchecked_field('pets_table')
    expect(page).to have_unchecked_field('kids_table')
    click_button 'Submit'

    expect(current_path).to eq(user_path(User.last))
    expect(User.last.first_name).to eq(@test_user.first_name)
    expect(User.last.last_name).to eq(@test_user.last_name)
    expect(User.last.email).to eq(@test_user.email)
    expect(User.last.plan_table).to eq(true)
    expect(User.last.car_table).to eq(true)
    expect(User.last.house_table).to eq(true)
    expect(User.last.prep_kit_table).to eq(true)
    expect(User.last.records_table).to eq(true)
    expect(User.last.pets_table).to eq(false)
    expect(User.last.kids_table).to eq(false)
  end
end
