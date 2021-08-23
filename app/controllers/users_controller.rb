class UsersController < ApplicationController
  before_action :authenticate_user! #, except: [:index,:show]
  before_action :correct_user, only: [:show,:edit,:update,:destroy]

  def index
    if current_user.admin?
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
end

def destroy
  # @friend.destroy
  # @friend.active = false
  # @friend.save
  #  respond_to do |format|
  #    format.html { redirect_to friends_url, notice:  "Friend was successfully destroyed."}
  #    format.json { head :no_content }
  #  end
 end