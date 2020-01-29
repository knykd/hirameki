FactoryBot.define do
  factory :user do
    sequence(:name) {|n|"name_#{n}"}
    sequence(:email) {|n|"email_#{n}@example.com"}
    password { 'password' }
    password_confirmation { 'password' }
  end
end
