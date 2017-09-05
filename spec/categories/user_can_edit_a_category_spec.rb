require 'rails_helper'

RSpec.feature "user can edit a category" do
  scenario "from main page" do
    category = create(:category)
    title = category.title

    visit(categories_path)
    click_on("Edit", match: :first)
    fill_in "category_title", with: "yo mama"
    click_on("Update Category")

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("yo mama")
    expect(page).to_not have_content(title)
  end
end
