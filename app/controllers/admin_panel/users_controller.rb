module AdminPanel
  class UsersController < ApplicationController
      def index
        @users = User.where(role: "User")
      end

      def delete
          @user = User.find(params[:id])

          if @user.destroy
            redirect_to admin_panel_users_path, notice: "user delete succssfully"
          else
            redirect_to admin_panel_users_path, notice: "user can't be delete"
          end
      end
  end
end