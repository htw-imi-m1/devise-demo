FactoryGirl.define do
  factory :user_story do
    number 'S001'
    title 'Users can search for Stories'
    description 'Users can search for text contained in user story descriptions'
    points 13
  end
end
