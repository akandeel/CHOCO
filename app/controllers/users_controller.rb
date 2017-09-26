class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])
   # @sales = @user.sales YOU NEED AFTER SALES MODEL IS MADE.
 end

  def new
    #@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You are logged in!"
      redirect_to 'user'
    else
      render 'users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        redirect_to(:action => 'show', :id=> @user.id)
      else
        render 'edit'
    end
  end


  def destroy
  end

private

def user_params
  params.require(:user).permit(:password,
                                   :password_confirmation,
                                   :first_name,
                                   :last_name,
                                   :gender,
                                   :date_of_birth,
                                   :country,
                                   :street_number,
                                   :street_name,
                                   :state,
                                   :suit,
                                   :mailing_address,
                                   :email_address
                                   )
  end
end
