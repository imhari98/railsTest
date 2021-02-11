class WelcomeController < ApplicationController
before_action :authenticate_user!
    def index
        @user = current_user
    end
    def test
    end
end
