FactoryGirl.define do
  factory :user do
    email "team@backlog.org"
    password "geheim123"
    password_confirmation "geheim123"
  end

  factory :admin, class: User do
    email "admin@backlog.org"
    password "geheim123"
    password_confirmation "geheim123"
    role :admin
  end

  factory :product_owner, class: User do
    email "po@backlog.org"
    password "geheim123"
    password_confirmation "geheim123"
    role :product_owner
  end
  factory :chicken, class: User do
    email "chicken@backlog.org"
    password "geheim123"
    password_confirmation "geheim123"
    role :chicken
  end

end
