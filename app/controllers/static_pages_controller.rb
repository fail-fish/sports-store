class StaticPagesController < ApplicationController
  def index
    @pagy, @latest_products = pagy(Product.all.latest, items: 8)
  end
end
