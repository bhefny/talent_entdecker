class StaticController < ApplicationController

  def index
    @team = [
      {name: "Nizar Hegazy", title: "Recruitment Specialist", image: "nhegazy.jpg", facebook: "nhegazy", linkedin: "nhegazy"},
      {name: "Mohamed Moursy", title: "Business Development", image: "mmoursy.jpg", facebook: "mmoursy", linkedin: "mmoursy"},
      {name: "Bassem Hefny", title: "Technology Director", image: "bhefny.jpg", facebook: "bhefny", linkedin: "bhefny"},
    ]
    @technologies = %w(ruby php js docker)
    @year_footer = GlobalSetting.find_by(key: 'year_footer').try(:value)
  end

  def email
    if verify_recaptcha
      send_email_contact(contact_params)
    end
    redirect_to action: :index, :only_path => true
  end

  private

  def contact_params
    @contact_params = @contact_params || params.permit(:name, :email, :phone, :message)
  end

end
