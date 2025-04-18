class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: "Welcome to the Todo app!"
    else 
      flash.now[:alert]="All the fields are compulsory!! Try again."
      render :new
    end
  end

  private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

end
