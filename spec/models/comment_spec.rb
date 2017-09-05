require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:job) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:title) }
end
