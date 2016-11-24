class DeliveryReturns < ApplicationController
  def new
    @delivery_return = DeliveryReturn.new
  end

  def create

  end

  private

  def delivery_return_params

  end
end
