class Admin::DashboardController < Admin::BaseAdminController

  def show
    @products_count = Product.count
    @categories_count = Category.count
    @sales_count = Sale.count
  end
end
