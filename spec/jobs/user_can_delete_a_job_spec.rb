require 'rails_helper'

RSpec.feature "user can delete a job" do
  scenario "from main page" do
    job = create(:job)
    company = job.company

    visit(company_jobs_path(company))
    click_on("Delete", match: :first)

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to_not have_content(job.title)
  end

  scenario "from individual page" do
    job = create(:job)
    company = job.company

    visit(company_job_path(company, job))
    click_on("Delete")

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to_not have_content(job.title)
  end
end
