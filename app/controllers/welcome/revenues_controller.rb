class Welcome::RevenuesController < ApplicationController
  def index
    @revenues = Revenue.all.limit(8)
    @categories = Category.all
  end

  def show
    @revenue = Revenue.find(params[:id])
  end
end
