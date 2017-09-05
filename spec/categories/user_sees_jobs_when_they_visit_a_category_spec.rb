require 'rails_helper'

RSpec.feature "user can see jobs" do
  scenario "from category show page" do
    category = create(:category)
    job = create(:job)
    category.jobs << job

    visit(category_path(category))

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end
end
