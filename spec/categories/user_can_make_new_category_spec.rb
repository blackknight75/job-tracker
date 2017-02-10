require 'rails_helper'

describe "user visits category new page"
  scenario 'user fills in form, submits and sees a category show page'

  fill_in("category[name]", with:)
  click_button('submit')

  expect(current_path).to eq()
  end
end
