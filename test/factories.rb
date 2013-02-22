FactoryGirl.define do
  factory :word do
    name 'Apple'
    group 'Fruits'
    level 1
  end

  factory :user do
    familyname 'Oda'
    email 'example@mail.com'
    password 'password'
  end

  factory :kid do
    name 'Keiko'
  end
end
