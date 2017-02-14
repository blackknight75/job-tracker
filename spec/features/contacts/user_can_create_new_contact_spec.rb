require 'rails_helper'

  describe 'when a user visits the create new' do
    scenario 'they fill in a form and click create contact' do
      category = Category.create(title: "Technology")
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      contact = company.contacts.create!(name: "John Doe", job_id: job.id, email: "thisisanemail@gmail.com", company_id: company)

      visit new_company_contact_path(company)

      fill_in "Name", with: "John Doe"
      fill_in "Email", with: "thisisanemail@gmail.com"
      click_button "Create Contact"

      expect(page).to have_current_path company_jobs_path(company)
      expect(page).to have_content("John Doe")
    end
  end
