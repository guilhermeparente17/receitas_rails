class Welcome::RevenuesController < ApplicationController
  def index
    @revenues = Revenue.all
    @categories = Category.all
  end
end
