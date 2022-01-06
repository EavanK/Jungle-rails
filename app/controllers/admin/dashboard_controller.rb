class Admin::DashboardController < ApplicationController

  def index
  end

  def show
    @products = Product.count
    @categories = Category.count
  end

end
