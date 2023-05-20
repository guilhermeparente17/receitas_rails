class UserSystemController < ApplicationController
    layout "user_system"
    before_action :authenticate_user!
end
