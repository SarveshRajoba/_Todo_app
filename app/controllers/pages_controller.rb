class PagesController < ApplicationController
  def welcome
        if logged_in?
          redirect_to tasks_path
        end
  end
end
