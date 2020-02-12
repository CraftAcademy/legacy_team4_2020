# frozen_string_literal: true


feature 'Check if user can create account' do
  context 'user is in sign up page.'

  before do
    visit new_user_registration_path
  end

  it 'User can see password' do
    expect(page).to have_content 'Password'
  end

  it 'User can see name' do
    expect(page).to have_content 'Name'
  end

  it 'User can see Email' do
    expect(page).to have_content 'Email'
  end

  it 'User can see Password confirmation' do
    expect(page).to have_content 'Password confirmation'
  end

  it 'User can see log in, in sign up' do
    expect(page).to have_content 'Log in'
  end
end

# Filling form and making test:

feature 'User can create the account' do
  
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
end