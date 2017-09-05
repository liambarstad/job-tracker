FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "MyString#{i}"
    end
  end
end
