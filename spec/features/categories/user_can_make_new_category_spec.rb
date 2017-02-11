require 'rails_helper'

describe "user visits category new page" do
  scenario 'user fills in form, submits and sees a category show page' do

  visit new_category_path
  fill_in("Title", with: "Technology")
  click_button('Create Category')

  expect(current_path).to eq(category_path(Category.last))
  expect(page).to have_content("Technology")
  end

  scenario "user fills in form with existing category and is redirected to create category" do
    category = Category.create(title: "Technology")

    visit new_category_path
    fill_in("Title", with: "Technology")
    click_button('Create Category')

    expect(current_path).to eq(new_category_path)

  end

end
