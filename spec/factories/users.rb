FactoryBot.define do
    factory :user do
      name {"James"}
      email {"user@mail.com"}
      password {"123456789"}
      password_confirmation {"123456789"}
    end
  end