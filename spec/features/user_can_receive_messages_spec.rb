feature 'User to see an inbox' do
  let(:receiver) { FactoryBot.create(:user)} 
  let(:sender) { FactoryBot.create(:user, name:'John' , email:'jhon@mail.com', password:'123456789')}

  before do
    login_as receiver
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
      sender.send_message(receiver, 'james', 'Hello there!')
      end

      it 'should have 1 new message in the inbox' do
        count = receiver.mailbox.inbox.count
        expect(count).to eq 1
      end
  end
end


