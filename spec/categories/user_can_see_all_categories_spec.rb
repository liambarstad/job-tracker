require 'rails_helper'

RSpec.feature "user can see all categories" do
  scenario "on main page"do
    category1, category2 = create_list(:category, 2)

    visit("/categories")

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end
end
