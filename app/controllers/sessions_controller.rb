class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(email: params[:email])
  
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back to the Todo app!"
      redirect_to tasks_path
    else
      flash.now[:alert] = "Invalid email or password. Please try again."
      @user = User.new
      render :new, status: :unprocessable_entity
    end
  end
  

    def destroy
      session[:user_id] = nil
      redirect_to welcome_path, notice: "Logged out successfully."
    end
end
