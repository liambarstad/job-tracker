class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.by_interest
    all.sort_by { |c| c.average_job_interest }.to_a.reverse
  end

  def average_job_interest
    total = jobs.reduce(0) { |total, job| total += job.level_of_interest }
    (total.to_f / jobs.count.to_f).round(2)
  end

end
