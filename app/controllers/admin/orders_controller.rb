class Admin::OrdersController < InheritedResources::Base
  before_action :authenticate_admin!

  actions :index
end
