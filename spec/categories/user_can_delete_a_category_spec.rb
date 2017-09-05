require 'rails_helper'

RSpec.feature "user can delete a category" do
  scenario "from main page" do
    category = create(:category)

    visit(categories_path)
    click_on("Delete", match: :first)

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(category.title)
  end
end
