require 'rails_helper'

feature "user vistis job show page" do
  scenario "a user can edit a job" do

  company = Company.create!(name: "Ninja Works")
  job = Job.create!(
                    title: "Ninja Dev",
                    city: "Denver",
                    description: "an wesome job with ninjas",
                    level_of_interest: 5,
                    company_id: company.id
                    )
  visit company_job_path(company, job)

  click_button "Edit"
  expect(current_path).to eq edit_company_job_path(company, job)
  end
end
