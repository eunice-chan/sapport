class UsersController < ApplicationController

  def update
    @user = User.find(current_user.id)

    if @user.update(update_params)
      flash[:notice] = "Update successful!"
    else
      flash[:alert] = "Update failed!"
    end

    redirect_to "/gives"
  end

  def browse
  end

  protected
  def update_params
   params.permit(:description)
  end

end
