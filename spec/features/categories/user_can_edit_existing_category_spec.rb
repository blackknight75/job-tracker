require 'rails_helper'

describe "when a user visits categories index" do
  scenario "they click on edit and can change the name of category" do
    category1 = Category.create(title: "Technology")
    category2 = Category.create(title: "Custodial")
    company1 = Company.create!(name: "ESPN")
    job1 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category1.id)
    category = Category.create(title: "Technology")
    company2 = Company.create!(name: "Turing")
    job2 = company2.jobs.create!(title: "Operations Manager", level_of_interest: 70, city: "Denver", category_id: category2.id)

    visit categories_path
    first(:button, "Edit").click
    expect(current_path).to eq(edit_category_path(category1))
    fill_in("Title", with: "Management")
    click_button('Update Category')

    expect(page).to have_content("Management")
  end
end
