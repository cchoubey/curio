class UsersController < ApplicationController
  before_action :authenticate_user! #, except: [:index,:show]
  #before_action :correct_user #, only: [:show,:edit,:update,:destroy]
  Usr = Struct.new(:id, :first_name, :last_name, :email, :active, :client_type)
  def index
    @users = []
    
    usr_type = UserType.find_by_id(current_user.user_type_id)
    if usr_type.metric == 100
      allusers = User.select(:id, :first_name, :last_name, :email, :active, :user_type_id, :client_type)
      .joins("join user_types ut on ut.id = user_type_id ").order_by_first_name
      allusers.each do |u|
        @users.push(Usr.new(u.id, u.first_name, u.last_name, u.email, u.active, u.client_type))
      end
    else
      ownuser = User.find_by_id(current_user.id)
      if ownuser.active?
        @users.push(Usr.new(ownuser.first_name, ownuser.last_name, ownuser.email, ownuser.active, usr_type.client_type))
      else
        u = Usr.new
        @users = Array.new(1, u)
      end
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.active = !user.active
    user.save
    respond_to do |format|

    if user.id != current_user.id  
      if !user.active 
        format.html { redirect_to users_url, notice:  "user was successfully destroyed."}
      else
        format.html { redirect_to users_url, notice:  "user was successfully reinstated."}
      end
    else
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(user))
      format.html { redirect_to root_path, notice:  "Your account is closed."}
    end
      format.json { head :no_content }
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

end