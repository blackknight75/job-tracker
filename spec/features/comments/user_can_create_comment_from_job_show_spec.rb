require 'rails_helper'

describe 'when a user visits a job show page' do
  scenario "they can add a comment to that job" do

    category = Category.create(title: "Technology")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit(company_job_path(company, job))

    fill_in "Content", with: "This is a comment."
    click_button "Create Comment"

    expect(page).to have_content("This is a comment")
  end
end
