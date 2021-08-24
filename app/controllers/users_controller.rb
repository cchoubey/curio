class UsersController < ApplicationController
  before_action :authenticate_user! #, except: [:index,:show]
  #before_action :correct_user #, only: [:show,:edit,:update,:destroy]

  def index
    usr_type = UserType.find_by_id(current_user.user_type_id)
    if usr_type.metric == 100
      @users = User.all.order_by_first_name
    else
      ownuser = User.find_by_id(current_user.id)
      if ownuser.active?
        @users = Array.new(1, ownuser) 
      else
        u = User.new
        @users = Array.new(1, u)
      end
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.active = false
    user.save
    respond_to do |format|
      format.html { redirect_to users_url, notice:  "user was successfully destroyed."}
      format.json { head :no_content }
    end
  end

end