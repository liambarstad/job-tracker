require 'rails_helper'

RSpec.feature "user can view dashboard" do
  scenario "and see jobs sorted by level of interest" do
    job1 = create(:job, level_of_interest: 1)
    job2 = create(:job, level_of_interest: 2)
    job3 = create(:job, level_of_interest: 3)
    job4 = create(:job, level_of_interest: 4)

    visit("/dashboard")

    expect(page).to have_content("Jobs with level of interest 1")
    expect(page).to have_content("Jobs with level of interest 2")
    expect(page).to have_content("Jobs with level of interest 3")
    expect(page).to have_content("Jobs with level of interest 4")
    expect(page).to have_content("Jobs with level of interest 5")
    expect(page).to have_content("Jobs with level of interest 6")
    expect(page).to have_content("Jobs with level of interest 7")
    expect(page).to have_content("Jobs with level of interest 8")
    expect(page).to have_content("Jobs with level of interest 9")
    expect(page).to have_content("Jobs with level of interest 10")
    expect(page).to have_css(".jobswith", count: 10)
  end

  scenario "and see the top three companies with jobs by average level of interest" do
    company1 = create(:company, name: "company1")
    company2 = create(:company, name: "company2")
    company3 = create(:company, name: "company3")
    company4 = create(:company, name: "company4")
    higher_jobs_1_1 = create_list(:job, 5, company: company1, level_of_interest: 7)
    higher_jobs_1_2 = create_list(:job, 3, company: company1, level_of_interest: 5)
    higher_jobs_2_1 = create_list(:job, 4, company: company2, level_of_interest: 5)
    higher_jobs_2_2 = create_list(:job, 3, company: company2, level_of_interest: 4)
    higher_jobs_3_1 = create_list(:job, 4, company: company3, level_of_interest: 4)
    higher_jobs_3_1 = create_list(:job, 4, company: company3, level_of_interest: 3)
    higher_jobs_4_1 = create_list(:job, 7, company: company4, level_of_interest: 2)

    visit("/dashboard")

    expect(page).to have_css(".highestjobs", count: 3)
    expect(page).to have_content("company1")
    expect(page).to have_content("company2")
    expect(page).to have_content("company3")
    expect(page).to_not have_content("company4")
    expect(page).to have_content("6.25")
    expect(page).to have_content("4.57")
    expect(page).to have_content("3.5")
    expect(page).to_not have_content("2.00")
  end

  scenario "and see the jobs sorted by location" do
    location1 = "Harappa"
    location2 = "Aleppo"
    job1 = create(:job, city: location1)
    job2 = create(:job, title: "Real OG", city: location2)

    visit("/dashboard")

    expect(page).to have_css(".location", count: 2)

    click_on(location1)

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end
end
