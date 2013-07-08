# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title "MyString"
    link "MyString"
    commenter "MyString"
    description "MyText"
    opined_at "2013-07-07 22:13:56"
    blog nil
  end
end
