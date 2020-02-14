FactoryBot.define do
    factory :user do
      name {"James"}
      email {"user@mail.com"}
      password {"password99"}
      password_confirmation {"password99"}
    end

    factory :usertwo do
      #set_up user2
      name {"Jhon"}
      email {"usertwo@mail.com"}
      password {"password"}
    end
  end