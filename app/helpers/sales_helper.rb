module SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def sale
    Sale.active
  end

end