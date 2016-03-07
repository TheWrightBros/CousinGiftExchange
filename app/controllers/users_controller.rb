class UsersController < ApplicationController

  def create
    unless params['id'] && user = User.find(params['id'])
      user = User.new()
      user.save
    end

    user.form_type = params['form_type']
    user.update(user_params); # add all of the new params form the form to the user

    render json: user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
