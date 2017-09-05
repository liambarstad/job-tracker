class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :category_jobs
  has_many :jobs, through: :category_jobs
end
