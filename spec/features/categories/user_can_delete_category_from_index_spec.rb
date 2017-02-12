require 'rails_helper'

describe "when user visits categories index page" do
  scenario "they can click on delete and category is deleted" do

    category1 = Category.create(title: "Technology")
    category2 = Category.create(title: "Custodial")
    company1 = Company.create!(name: "ESPN")
    job1 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category1.id)
    category = Category.create(title: "Technology")
    company2 = Company.create!(name: "Turing")
    job2 = company2.jobs.create!(title: "Operations Manager", level_of_interest: 70, city: "Denver", category_id: category2.id)

    visit categories_path
    # click_on "Delete"
    first(:button, "Delete").click

    expect(page).not_to have_content("Technology")
  end
end
