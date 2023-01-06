require 'rails_helper'

RSpec.describe 'Users show page' do
  describe 'When I visit /users/:id' do
    before do
      @user_1 = create(:user, car_table: true, house_table: true)
      @user_2 = create(:user, kids_table: true, pets_table: true)
      create(:plan, user: @user, review_insurance_docs: true)
      visit user_path(@user_1)
    end
    describe "Then I see" do
      describe 'A checklist' do
        it 'That has manditory sections: "Plan", "Records", and "Prep Kit"' do
          within '#base-checklist' do
            expect(page).to have_content("Plan")
            expect(page).to have_content("Review Insurance Documents")
            # expect(page).to have_content("Records")
            # expect(page).to have_content("Medical")
            # expect(page).to have_content("Prep Kit")
            # expect(page).to have_content("Extra Batteries")
            expect(page).to have_button("Update")
          end
        end

        it 'That has optional sections, chosen by user: Car and House' do
          within '#kids-checklist' do
            expect(page).to have_content("Kids")
            expect(page).to have_content("")
          end
          within '#pets-checklist' do
            expect(page).to have_content("Pets")
            expect(page).to have_content("Review Insurance Documents")
          end
        end

        it 'That has optional sections, chosen by user: Kids and Pets' do
          visit user_path(@user_2)
          within '#kids-checklist' do
            expect(page).to have_content("Kids")
            expect(page).to have_content("")
          end
          within '#pets-checklist' do
            expect(page).to have_content("Pets")
            expect(page).to have_content("Review Insurance Documents")
          end
        end
        it 'When I check a box and click on "Update" that users plan is updated' do
          expect(@user.plan.check_evac_zone).to be(false)
          within '#base-checklist' do
            check 'plan_check_evac_zone'
            click_button 'Update'

            expect(User.find(@user.id).plan.check_evac_zone).to be(true)
          end
        end
      end
      describe 'A "Check-WX button' do
        context 'When I press "Check-WX" and an alert exists' do
          it 'A flash message is returned'
          it 'An email is sent'
        end
        context 'When I press "Check-WX" and there is NO alert' do
          it 'A flash message is returned'
        end
      end
    end
  end
end