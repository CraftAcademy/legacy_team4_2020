# frozen_string_literal: true


feature 'User can create the account' do 
  let(:registered_user) {create(:user)} 

  before do
    visit new_user_registration_path
  end

  describe "[Happy path] successfully" do
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

  describe '[Sad path] unnsuccssfully with' do

    describe 'invalid email' do

      before do
        fill_in 'Name', with: 'Jaime'
        fill_in 'Email', with: 'asdgmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_on 'Create'
      end

      it 'returns the email is invalid' do
        expect(page).to have_content '8 characters minimum'
      end
    end

    describe 'already used email address' do
      context do
        let(:registered_user) {create(:user)} 
      end

      before do
        fill_in 'Name', with: 'Popeye'
        fill_in 'Email', with: 'user@mail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_on 'Create'
      end

      it 'returns the email been used already' do
        expect(page).to have_content 'Email has already been taken'
      end
    end
  end
end