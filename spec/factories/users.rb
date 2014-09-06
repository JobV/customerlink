FactoryGirl.define do
  factory :user do
    email
    password 'jobiscool'
    password_confirmation 'jobiscool'
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end
end
