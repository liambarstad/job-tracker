require 'rails_helper'

RSpec.feature "user can see jobs sorted by level of interest" do
  scenario "from dashboard" do
    job1 = create(:job, title: "job1", level_of_interest: 9)
    job2 = create(:job, title: "job2", level_of_interest: 7)
    job3 = create(:job, title: "job3", level_of_interest: 3)    

    visit("/dashboard")
    click_on("Full List")

    expect(page.find('li:nth-child(1)')).to have_content(job1.title)
    expect(page.find('li:nth-child(2)')).to have_content(job2.title)
    expect(page.find('li:nth-child(3)')).to have_content(job3.title)
  end
end
