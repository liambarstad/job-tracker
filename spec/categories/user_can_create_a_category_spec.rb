require 'rails_helper'

RSpec.feature "user can create a category" do
  scenario "new category" do

    visit("/categories/new")

    fill_in "category_title", with: "all dis stuff"
    click_on("Create Category")
    category = Category.find_by(title: "all dis stuff")

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(category.title)
  end

  scenario "existing category" do
    category = create(:category)

    visit("/categories/new")

    fill_in "category_title", with: category.title
    click_on("Create Category")

    expect(current_path).to eq(new_category_path)
  end
end
