FactoryBot.define do
  factory :idea do
    sequence(:title) {|n|"title#{n}"}
    sequence(:category) {|n|"category#{n}"}
    body { 'text' }
    user
  end
end
