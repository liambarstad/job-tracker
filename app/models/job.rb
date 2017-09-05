class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :category_jobs
  has_many :categories, through: :category_jobs
  has_many :comments

  def self.increment_by_level_of_interest
    incremented_array = []
    for i in 1..10 do
      incremented_array << where(level_of_interest: i).to_a
    end
    incremented_array
  end

  def self.locations
    all.collect(&:city).uniq
  end

  def self.sort_by_location
    all_locations = convert_to_array(locations)
    all_locations.reduce({}) do |result, location|
      result.store(location, all.where(city: location).to_a)
      result
    end
  end

  private

  def self.convert_to_array(collection)
    if !(collection.is_a?(Array))
      [collection]
    else
      collection
    end
  end


end
