FactoryGirl.define do
  factory :company do
    sequence :name do |i|
      "Gulag#{i}"
    end
  end
end
