require 'rails_helper'

feature "user vistis job show page" do
  scenario "a user can edit a job" do
category = Category.create(title: "Technology")
company = Company.create!(name: "Ninja Works")
  job = Job.create!(
                    title: "Ninja Dev",
                    city: "Denver",
                    description: "an wesome job with ninjas",
                    level_of_interest: 5,
                    company_id: company.id,
                    category_id: category.id
                    )
  visit company_job_path(company, job)
  click_button "Edit"
  fill_in "job_city", with: "Seattle"

  expect(current_path).to eq edit_company_job_path(company, job)

  click_button "Update Job"
  expect(current_path).to eq company_job_path(company, job)

  expect(page).to have_content("Seattle")
  end
end
