FactoryGirl.define do
  factory :user do
    email "hello345345345345435@gmail.com"
    password "abcdefghi345345345"
  end

  factory :comment do
    rating "1_star"
    message "Hi"
    user
    place 

  end

  factory :place do
  	name "Location"
  	address "1182 drive"
  	description "Hi"
  	user 
  end

end