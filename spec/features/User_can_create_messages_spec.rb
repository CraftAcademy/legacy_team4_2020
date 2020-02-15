features 'User can create a message' do
let(:user) {create(:user)}
let(:recipient) {create(:user, name:'Philip', email: 'philip@mail.com',)}
    before do
      login_as user
      new_conversation_path
    end

    describe 'User creates message' do
        before do
        fill_in 'recipient' with: recipient.name
        fill_in 'Subject' with: 'Hello!'
        fill_in 'Message' with: 'This is a test! hoping it works.'
        click_on 'Send Message'     
        end
        
        it 'expects the email to be sent' do
            expect(page).to have_content 'Your message was successfully sent!'
        end
    end
end