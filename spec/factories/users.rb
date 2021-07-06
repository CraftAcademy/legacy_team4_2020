FactoryBot.define do
    factory :user do
      name {"James"}
      email {"user@mail.com"}
      password {"password99"}
      password_confirmation {"password99"}
    end
  end