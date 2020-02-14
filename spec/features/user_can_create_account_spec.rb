# frozen_string_literal: true

require 'pry'
feature 'User can create the account' do
 let(:registered_user) {create(:user)}

  before do
    visit new_user_registration_path
  end

  describe "successfully" do
    before do

      fill_in 'Name', with: "jaime"
      fill_in 'Email', with: "asd@gmail.com"
      fill_in 'Password', with: "asdasd12"
      fill_in 'Password confirmation', with: "asdasd12"

      click_on 'Create'
    end

    it 'Welcome message gets displayed' do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    it 'sends user to index page' do
      expect(current_path).to eq root_path
    end
  end

  describe 'Sad path, user forgets email' do

    describe 'invalid email' do
        before do
            fill_in 'Name', with: 'jaime'
            fill_in 'Email', with: 'asdgmail.com'
            fill_in 'Password', with: 'asdasd12'
            fill_in 'Password confirmation', with: 'asdasd12'
    
    
            click_on 'Create'
        end

        it 'returns the email is invalid' do
            expect(page).to have_content 'Email is invalid'
        end
    end
  end

  describe 'already used email address' do
      
    before do
      fill_in 'Name', with: 'popeye'
      fill_in 'Email', with: registered_user.email
      fill_in 'Password', with: 'password99'
      fill_in 'Password confirmation', with: 'password99'
      click_on 'Create'
    end

    it 'returns the email been used already' do
      expect(page).to have_content 'Email has already been taken'
    end
  end
end