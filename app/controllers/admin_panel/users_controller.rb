module AdminPanel
  class UsersController < ApplicationController
      def index
        @users = User.all
      end

      def delete
          
      end
  end
end