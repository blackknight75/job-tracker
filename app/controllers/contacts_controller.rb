class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new()
  end

  def create
    # binding.pry
    contact = Contact.new(contact_params)
    if contact.save
      redirect_to company_path(contact_params[:company_id])
    else
      render :new
    end
  end

  private

  def contact_params
    a = params.require(:contact).permit(:name, :email, :job_id, :company_id)
    a[(params.permit(:company_id)).keys.join] = (params.permit(:company_id)).values.join
    a
  end
end
