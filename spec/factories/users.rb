FactoryBot.define do
    factory :user do
      #Set_up user
      name {"James"}
      email {"user@mail.com"}
      password {"password"}
    end

    factory :usertwo do
      #set_up user2
      name {"Jhon"}
      email {"usertwo@mail.com"}
      password {"password"}
    end
  end