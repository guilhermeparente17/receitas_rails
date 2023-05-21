class WelcomeController < ApplicationController
  def index
    @revenues = Revenue.all
  end
end
