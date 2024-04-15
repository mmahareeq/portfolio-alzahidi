class Admin::UsersController < ApplicationController
     before_action :authenticate_admin!

    def index 
      @users = User.all
    end
    
    def change_authority
        puts params
        @user = User.find(params[:id])
        puts  @user
        if @user.update(authority: params[:authority])
           redirect_to admin_users_path, notice: "User authority changed successfully."
       else
          redirect_to admin_users_path, alert: "Failed to change user authority."
        end

        
    end
    def authenticate_admin!
        unless current_user.authority == "admin"
            redirect_to root_path, alert: 'Access Denied'
        end 
    end
end

