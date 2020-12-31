class ProductsController < InheritedResources::Base
  before_action :authenticate_user!

  actions :index, :show
end
