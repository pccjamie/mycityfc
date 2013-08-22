# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team, :class => 'Teams' do
    name "MyString"
    logo "MyText"
    league "MyString"
    city "MyString"
    state "MyString"
    venue "MyString"
    latitude 1.5
    longitude 1.5
  end
end
