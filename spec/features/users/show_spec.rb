require 'rails_helper'
require './app/services/west_fl_wx_service'
require './app/facades/weather_facade'

RSpec.describe 'Users show page' do
  describe 'When I visit /users/:id' do
    before do
      allow(User).to receive(:current_user_by_with_conditional).and_return(user_1)
      allow(User).to receive(:current_user_by).and_return(user_1)
      visit user_path(user_1)
    end

    let!(:user_1) { create(:user, car_table: true, house_table: true, kids_table: false, pets_table: false) }
    let!(:user_2) { create(:user, kids_table: true, pets_table: true, car_table: false, house_table: false) }

    describe 'Then I see' do
      describe 'A checklist' do
        it 'That has mandatory sections: "Plan", "Records", and "Prep Kit"' do
          within '#plan-checklist' do
            expect(page).to have_content('Plan')
            expect(page).to have_content('Review Insurance Documents')
            expect(page).to have_button('Update Plan')
          end

          within '#prep-checklist' do
            expect(page).to have_content('Prep Kit')
            expect(page).to have_content('Extra batteries')
            expect(page).to have_button('Update Prep Kit')
          end

          within '#record-checklist' do
            expect(page).to have_content('Records')
            expect(page).to have_content('Government issued ID')
            expect(page).to have_button('Update Records')
          end
        end

        it 'That has optional sections, chosen by user: Car and House' do
          within '#house-checklist' do
            expect(page).to have_content('House')
            expect(page).to have_content('Trim trees')
            expect(page).to have_button('Update House')
          end

          within '#car-checklist' do
            expect(page).to have_content('Car')
            expect(page).to have_content('Fill gas tank')
            expect(page).to have_button('Update Car')
          end
        end

        it 'That has optional sections, chosen by user: Kids and Pets' do
          allow(User).to receive(:current_user_by_with_conditional).and_return(user_2)
          allow(User).to receive(:current_user_by).and_return(user_2)
          visit user_path(user_2)

          within '#kids-checklist' do
            expect(page).to have_content('Kids')
            expect(page).to have_content('Toys')
            expect(page).to have_button('Update Kids')
          end

          within '#pets-checklist' do
            expect(page).to have_content('Pets')
            expect(page).to have_content('Food and water bowls')
            expect(page).to have_button('Update Pets')
          end
        end

        it 'When I check a box and click on "Update Plan" that users plan is updated' do
          expect(user_1.plan).to be(nil)

          within '#plan-checklist' do
            check 'plan_check_evac_zone'
            click_button 'Update Plan'
          end

          expect(User.find(user_1.id).plan.check_evac_zone).to be(true)
        end

        it 'When I check a box and click on "Update Prep Kit" that users prep_kit is updated' do
          expect(user_1.prep_kit).to be(nil)

          within '#prep-checklist' do
            check 'prep_kit_batteries'
            click_button 'Update Prep Kit'
          end

          expect(User.find(user_1.id).prep_kit.batteries).to be(true)
        end

        it 'When I check a box and click on "Update Records" that users record is updated' do
          expect(user_1.record).to be(nil)

          within '#record-checklist' do
            check 'record_medical'
            click_button 'Update Records'
          end

          expect(User.find(user_1.id).record.medical).to be(true)
        end

        it 'When I check a box and click on "Update House" that users house is updated' do
          expect(user_1.house).to be(nil)

          within '#house-checklist' do
            check 'house_trim_trees'
            click_button 'Update House'
          end

          expect(User.find(user_1.id).house.trim_trees).to be(true)
        end

        it 'When I check a box and click on "Update Car" that users car is updated' do
          expect(user_1.car).to be(nil)

          within '#car-checklist' do
            check 'car_gas'
            click_button 'Update Car'
          end
          expect(User.find(user_1.id).car.gas).to be(true)
        end

        it 'When I check a box and click on "Update Kids" that users kid is updated' do
          allow(User).to receive(:current_user_by_with_conditional).and_return(user_2)
          allow(User).to receive(:current_user_by).and_return(user_2)
          visit user_path(user_2)
          expect(user_2.kid).to be(nil)

          within '#kids-checklist' do
            check 'kid_toys'
            click_button 'Update Kids'
          end

          expect(User.find(user_2.id).kid.toys).to be(true)
        end

        it 'When I check a box and click on "Update Pets" that users pet is updated' do
          allow(User).to receive(:current_user_by_with_conditional).and_return(user_2)
          allow(User).to receive(:current_user_by).and_return(user_2)
          visit user_path(user_2)
          expect(user_2.pet).to be(nil)

          within '#pets-checklist' do
            check 'pet_crate'
            click_button 'Update Pets'
          end

          expect(User.find(user_2.id).pet.crate).to be(true)
        end
      end

      describe 'A "Check Weather" button' do
        context 'That when I press and an alert exists' do
          it 'A flash message is returned' do
            allow_any_instance_of(WestFLWXService).to receive(:query).and_return({ data: 'Current Alerts in Your Area' })

            within '#check-wx' do
              click_button 'Check Weather'
            end

            expect(page).to have_content('Current Alerts in Your Area')
          end
        end

        context 'That when I press and there is NO alert' do
          it 'A flash message is returned' do
            allow_any_instance_of(WestFLWXService).to receive(:query).and_return({ data: 'No Current Alerts' })

            within '#check-wx' do
              click_button 'Check Weather'
            end

            expect(page).to have_content('No Current Alerts')
          end
        end
      end

      describe 'A "Edit Profile" button' do
        context 'That when I press' do
          it 'redirects to /users/:id/edit' do
            visit "/users/#{user_1.id}"

            within '#edit-profile' do
              click_button 'Edit Profile'
            end

            expect(current_path).to eq("/users/#{user_1.id}/edit")
          end
        end
      end
    end
  end

  describe 'Updating current attributes' do
    let!(:user_1) { create(:user, car_table: true, house_table: true, kids_table: true, pets_table: true) }
    let!(:car) { Car.create!(user: user_1, maintenance: true) }
    let!(:house) { House.create!(user: user_1) }
    let!(:kid) { Kid.create!(user: user_1) }
    let!(:pet) { Pet.create!(user: user_1) }
    let!(:prep_kit) { PrepKit.create!(user: user_1) }
    let!(:record) { Record.create!(user: user_1) }
    let!(:plan) { Plan.create!(user: user_1) }

    before :each do
      allow(User).to receive(:current_user_by_with_conditional).and_return(user_1)
      allow(User).to receive(:current_user_by).and_return(user_1)
      visit user_path(user_1)
    end

    describe 'when the user has a car' do
      it 'can update the car' do
        expect(user_1.car.gas).to be(false)

        within '#car-checklist' do
          check 'car_gas'
          click_button 'Update Car'
        end

        expect(User.find(user_1.id).car.gas).to be(true)
      end
    end

    describe 'when the user has a house' do
      it 'can update the house' do
        expect(user_1.house.trim_trees).to be(false)

        within '#house-checklist' do
          check 'house_trim_trees'
          click_button 'Update House'
        end

        expect(User.find(user_1.id).house.trim_trees).to be(true)
      end
    end

    describe 'When the user has kids' do
      it 'can update the kid' do
        expect(user_1.kid.toys).to be(false)

        within '#kids-checklist' do
          check 'kid_toys'
          click_button 'Update Kids'
        end

        expect(User.find(user_1.id).kid.toys).to be(true)
      end
    end

    describe 'When the user has kids' do
      it 'can update the pet' do
        expect(user_1.pet.medicine).to be(false)

        within '#pets-checklist' do
          check 'pet_medicine'
          click_button 'Update Pets'
        end

        expect(User.find(user_1.id).pet.medicine).to be(true)
      end
    end

    describe 'When the user has a prep kit' do
      it 'can update the prep kit' do
        expect(user_1.prep_kit.toiletries).to be(false)

        within '#prep-checklist' do
          check 'prep_kit_toiletries'
          click_button 'Update Prep Kit'
        end

        expect(User.find(user_1.id).prep_kit.toiletries).to be(true)
      end
    end

    describe 'When the user has records' do
      it 'can update their records' do
        expect(user_1.record.medical).to be(false)

        within '#record-checklist' do
          check 'record_medical'
          click_button 'Update Records'
        end

        expect(User.find(user_1.id).record.medical).to be(true)
      end
    end

    describe 'When the user has plan' do
      it 'can update their plan' do
        expect(user_1.plan.evac_plan).to be(false)

        within '#plan-checklist' do
          check 'plan_evac_plan'
          click_button 'Update Plan'
        end

        expect(User.find(user_1.id).plan.evac_plan).to be(true)
      end
    end
  end
end
