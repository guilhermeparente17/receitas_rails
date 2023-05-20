class AdminSystemController < ApplicationController
    layout "admin_system"
    before_action :authenticate_admin!
end
