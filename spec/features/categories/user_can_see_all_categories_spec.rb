require 'rails_helper'

describe "when a user visits the categories show page" do
  scenario "they see a list of categories" do

  CATEGORIES = ["Technology", "Human Resources", "Administration"]
  CATEGORIES.each do |category|
    Category.create(title: category)
  end

  visit(categories_path)

  expect(page).to have_content("Technology")
  expect(page).to have_content("Human Resources")
  expect(page).to have_content("Administration")
  end
end
