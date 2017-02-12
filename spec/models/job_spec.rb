require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "DevOps", description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "DevOps", level_of_interest: 80, description: "Wahoo", category_id: 1)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = Job.new(title: "DevOps", level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "DevOps", level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: 1)
      expect(job).to respond_to(:company)
    end
  end
end
