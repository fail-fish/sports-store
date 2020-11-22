module ApplicationHelper
  include Pagy::Frontend

  def active_class(link_path)
    current_page?(link_path) ? 'nav-item active' : 'nav-item'
  end

  def user_has_products_in_carts?
    current_user.cart_count.positive?
  end
end
