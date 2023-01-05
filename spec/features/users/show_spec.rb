require 'rails_helper'

RSpec.describe 'Users show page' do
  describe 'When I visit /users/:id' do
    before do
      user = create(:user)
      visit user_path(user)
    end
    describe "Then I see" do
      describe 'A checklist' do
        it 'That has manditory sections: "Plan", "Records", and "Prep Kit"' do
          within '#base-checklist' do
            expect(page).to have_content("Plan")
            expect(page).to have_content("Review Insurance Docs")
            expect(page).to have_content("Records")
            expect(page).to have_content("Medical")
            expect(page).to have_content("Prep Kit")
            expect(page).to have_content("Extra Batteries")
          end
        end
        it 'That has optional sections, chosen by user: Car and House'
        it 'That has optional sections, chosen by user: Kids and House'
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