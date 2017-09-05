require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:jobs) }
  it { should validate_presence_of(:title) }
end
