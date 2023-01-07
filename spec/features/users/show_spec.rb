require 'rails_helper'

RSpec.describe 'Users show page' do
  describe 'When I visit /users/:id' do
    before do
      @user_1 = create(:user, car_table: true, house_table: true, kids_table: false, pets_table: false)
        create(:plan, user: @user_1, review_insurance_docs: true)
        create(:prep_kit, user: @user_1)
        create(:record, user: @user_1)
        create(:car, user: @user_1)
        create(:house, user: @user_1)
      @user_2 = create(:user, kids_table: true, pets_table: true, car_table: false, house_table: false)
        create(:plan, user: @user_2)
        create(:prep_kit, user: @user_2)
        create(:record, user: @user_2)
        create(:kid, user: @user_2)
        create(:pet, user: @user_2)
      visit user_path(@user_1)
    end
    describe "Then I see" do
      describe 'A checklist' do
        it 'That has manditory sections: "Plan", "Records", and "Prep Kit"' do
          within '#base-checklist' do
            expect(page).to have_content("Plan")
            expect(page).to have_content("Review Insurance Documents")

            expect(page).to have_content("Prep Kit")
            expect(page).to have_content("Extra batteries")

            expect(page).to have_content("Records")
            expect(page).to have_content("Government issued ID")
            expect(page).to have_button("Update", count: 3)
          end
        end

        it 'That has optional sections, chosen by user: Car and House' do
          within '#house-checklist' do
            expect(page).to have_content("House")
            expect(page).to have_content("Trim trees")
            expect(page).to have_button("Update")
          end
          within '#car-checklist' do
            expect(page).to have_content("Car")
            expect(page).to have_content("Fill gas tank")
            expect(page).to have_button("Update")
          end
        end

        it 'That has optional sections, chosen by user: Kids and Pets' do
          visit user_path(@user_2)
          within '#kids-checklist' do
            expect(page).to have_content("Kids")
            expect(page).to have_content("Toys")
            expect(page).to have_button("Update")
          end
          within '#pets-checklist' do
            expect(page).to have_content("Pets")
            expect(page).to have_content("Food and water bowls")
            expect(page).to have_button("Update")
          end
        end
        it 'When I check a box and click on "Update" that users plan is updated' do
          expect(@user_1.plan.check_evac_zone).to be(false)
          within '#base-checklist' do
            check 'plan_check_evac_zone'
            first(:button, "Update").click

            expect(User.find(@user_1.id).plan.check_evac_zone).to be(true)
          end
        end
      end
      describe 'A "Check-WX button' do
        context 'That when I press and an alert exists' do
          it 'A flash message is returned'
          it 'An email is sent'
        end
        context 'That when I press and there is NO alert' do
          it 'A flash message is returned'
        end
      end
    end
  end
end