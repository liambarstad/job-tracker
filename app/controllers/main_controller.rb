class MainController < ApplicationController

  def dashboard
    @level_of_interest_jobs = Job.increment_by_level_of_interest
    @highest_companies = Company.by_interest[0..2]
    @locations = Job.locations
  end

end
