class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all

  end

  def index
    @user = current_user
    @books = Book.all
    @users = User.all

  end

  def edit

    @user = User.find(params[:id])

  end

  def update
    @user = User.new
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
