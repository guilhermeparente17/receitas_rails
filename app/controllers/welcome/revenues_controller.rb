class Welcome::RevenuesController < ApplicationController
  def index
    @revenues = Revenue.all
  end
end
