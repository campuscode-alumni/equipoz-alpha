class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @customer = Customer.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      render :new
    end
  end

  def show
    id = params[:id]
    @contract = Contract.find(id)
  end

private
  def contract_params
    contract_param = params.require(:contract)
      .permit(:customer_id, :delivery_address, :rental_period, :total_amount,
              :discount, :equipment, :contact)
  end
end
