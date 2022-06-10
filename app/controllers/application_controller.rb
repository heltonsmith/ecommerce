class ApplicationController < ActionController::Base

    def current_order
      if current_user
        order = Order.where(user_id: current_user.id).where(state: "created").last
        if order.nil?
          order = Order.create(user: current_user, state: "created")
        end
        return order
      end
  
      nil
    end

    rescue_from ActionController::Redirecting::UnsafeRedirectError do
      redirect_to root_url
    end
  end