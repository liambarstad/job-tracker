require 'rails_helper'

RSpec.feature "user can see jobs sorted by location" do
  scenario "from jobs page" do
    job = create(:job)
    job_at_hells_kitchen = create(:job, city: "Hell's Kitchen")
    job_with_different_name = create(:job, title: "Pogo Stick Enthusiast")

    visit("/jobs?sort=location")

    expect(page).to have_content("Hell's Kitchen")
    expect(page).to have_content("Yo Mama's House")
    expect(page).to have_content("Pogo Stick Enthusiast")
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.company.name)

    click_on(job.company.name)

    expect(current_path).to eq(company_jobs_path(job.company))
  end
end
