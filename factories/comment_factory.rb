FactoryGirl.define do
  factory :comment do 
    text "Is it out yet?" 
    user { |u| u.association(:user) }
    ticket { |t| t.association(:ticket) }
  end
end