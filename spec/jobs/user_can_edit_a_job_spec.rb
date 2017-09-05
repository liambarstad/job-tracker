require 'rails_helper'

RSpec.feature "user can edit a job" do
  scenario "from main page" do
    job = create(:job)
    title = job.title

    visit(company_jobs_path(job.company))
    click_on("Edit", match: :first)

    expect(current_path).to eq(edit_company_job_path(job.company, job))

    fill_in "job_title", with: "Slinging shit for santa"
    click_on("Update Job")

    expect(current_path).to eq(company_jobs_path(job.company))
    expect(page).to have_content("Slinging shit for santa")
    expect(page).to_not have_content(title)
  end

  scenario "from individual page" do
    job = create(:job)
    title = job.title

    visit(company_job_path(job.company, job))
    click_on("Edit", match: :first)

    expect(current_path).to eq(edit_company_job_path(job.company, job))

    fill_in "job_title", with: "Slinging shit for santa"
    click_on("Update Job")

    expect(current_path).to eq(company_jobs_path(job.company))
    expect(page).to have_content("Slinging shit for santa")
    expect(page).to_not have_content(title)
  end
end
