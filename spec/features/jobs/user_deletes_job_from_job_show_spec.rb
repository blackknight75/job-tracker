require 'rails_helper'

describe "User visits show page" do
  scenario "user clicks delete and is brought to comapny jobs index" do
  company = Company.create!(name: "Ninja Works")
  job = Job.create!(
                    title: "Ninja Dev",
                    city: "Denver",
                    description: "an wesome job with ninjas",
                    level_of_interest: 5,
                    company_id: company.id
                    )
  visit company_job_path(company, job)
  click_button "Delete"

  expect(current_path).to eq(company_jobs_path(company))
  expect(page).to_not have_content("Ninja Dev")  
  end
end
