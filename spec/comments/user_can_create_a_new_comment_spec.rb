require 'rails_helper'

RSpec.feature "user can submit a new comment" do
  scenario "from job page" do
    comment1 = build(:comment)
    comment2 = build(:comment, title: "fuzzypants plz")
    job = create(:job)
    company = job.company

    visit(company_job_path(company, job))
    fill_in "comment_title", with: comment1.title
    fill_in "comment_content", with: comment1.content
    click_on("Create")

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(comment1.title)
    expect(page).to have_content(comment1.content)
    expect(page).to have_content(comment1.created_at)

    fill_in "comment_title", with: comment2.title
    fill_in "comment_content", with: comment2.content
    click_on("Create")

    #expect one comment to be above the other
  end
end
