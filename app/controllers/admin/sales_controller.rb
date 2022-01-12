class Admin::SalesController < Admin::BaseAdminController

  def index
    @sales = Sale.all
  end

  def new
  end

end
