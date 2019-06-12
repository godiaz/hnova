class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :terms_and_conditions, :privacy, :about, :contact]

  def home
    @projects = Project.all
  end
end
