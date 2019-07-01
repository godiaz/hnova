class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :terms_and_conditions, :privacy, :about, :contact, :subscribe]

  def home
    @projects = Project.all
    @services = Service.all
  end

  def subscribe
    email = params[:email]
    gibbon = Gibbon::Request.new
    body = { email_address: email, status: 'subscribed' }
    begin
      gibbon.lists('f28827281f').members.create(body: body)
      flash[:notice] = 'Thank you for subscribing to the mailing list'
    rescue Gibbon::MailChimpError => e
      case e.title
      when 'Member Exists'
        flash[:error] = 'You are already subscribed to the mailing list'
      else
        flash[:error] = 'There was a problem subscribing you to the mailing list'
      end
    end
    redirect_to root_path
  end
end
