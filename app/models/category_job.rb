class CategoryJob < ApplicationRecord
  belongs_to :job
  belongs_to :category
end
