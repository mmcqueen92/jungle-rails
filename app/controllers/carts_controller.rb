class CartsController < ApplicationController

  def show
    if cart.empty?
      render(
        html: "<div class='alert'><p>Your cart is currently empty.</p><a href='/' class='btn btn-success'>Back to home page</a></div>".html_safe,
        layout: 'application'
      )
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_back fallback_location: root_path
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_back fallback_location: root_path
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
