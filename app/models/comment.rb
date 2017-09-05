class Comment < ApplicationRecord
  belongs_to :job
  validates :title, :content, presence: true
end
