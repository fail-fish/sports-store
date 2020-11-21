class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!

  def new
    # Implement in future
    # gon.client_token = generated_client_token
  end

  def create
    if result.success?
      current_user.purchase_cart_products!
      flash[:notice] = 'Congratulations! We\'ll try to get you '\
                       'your items as soon as possible'
      redirect_to root_url
    else
      flash[:alert] = 'Hmm, something went wrong, let\'s try again!'
      gon.client_token = generated_client_token
      render :new
    end
  end

  private

  def check_cart!
    return if current_user.cart_products_with_qty.present?

    redirect_to(root_url,
                alert: 'Please add some items to your cart '\
                'add before processing transaction')
  end

  def generated_client_token
    Braintree::ClientToken.generate
  end

  def result
    @result ||= Braintree::Transaction(
      amount: current_user.cart_total_price,
      payment_method_nonce: params[:payment_method_nonce]
    )
  end
end
