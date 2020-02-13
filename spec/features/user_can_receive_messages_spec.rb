feature 'User to see an inbox' do
  let(:registered_user) { FactoryBot.create(:user)} 
  let(:registered_user2) { FactoryBot.create(:usertwo)}

  before do
    login_as registered_user
    visit mailbox_sent_path
  end

 describe 'User is in login page' do
    before do
     click_on 'Inbox'
    end

    it 'shows a inbox to the user' do
      expect(current_path).to eq mailbox_inbox_path
    end
  end

 describe 'User recives a mail from Jhon' do
 
    before do
      visit mailbox_inbox_path
      registered_user.send_message(registered_user2.name, 'Hello Jhon')
      logout registered_user
      login_as registered_user2
      visit mailbox_inbox_path
    end

    it 'Expects user to have a mail.' do
      expect(page).to have_content 'James'
    end
  end
end


