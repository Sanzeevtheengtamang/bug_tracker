class HomeController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]

    def index
        # @user = User.all
    end
    def dashboard
        @users = User.all
    end

    private
    def admin?
        
    end
end
