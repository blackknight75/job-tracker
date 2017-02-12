class Category < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  has_many :jobs

    def terminate_jobs(jobs)
      jobs.each do |job|
        job.destroy
      end
    end
end
