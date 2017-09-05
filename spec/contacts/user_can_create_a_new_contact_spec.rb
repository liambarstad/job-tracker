require 'rails_helper'

RSpec.feature "user can create a new contact" do
  scenario "on a company page" do
    company = create(:company)
    contact = build(:contact)

    visit company_path(company)
    fill_in "contact_name", with: contact.name
    fill_in "contact_email", with: contact.email
    fill_in "contact_position", with: contact.position
    click_on("Create Contact")

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.email)
    expect(page).to have_content(contact.position)
  end
end
