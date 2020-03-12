class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:home, :about_us, :help_and_support]

  def home
  end

  def about_us

  end

  def help_and_support

  end
end
