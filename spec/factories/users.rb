FactoryGirl.define do
  factory :user do
    email "team@backlog.org"
    password "geheim123"
    password_confirmation "geheim123"
  end
end
