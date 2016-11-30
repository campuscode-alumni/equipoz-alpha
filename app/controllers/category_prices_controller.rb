class CategoryPricesController < ApplicationController
  def new
    @category_price = CategoryPrice.new
    @categories = Category.all
  end

  def create
    @category_price = CategoryPrice.create(category_prices_param)
    if @category_price.save
      redirect_to @category_price
    else
      flash.now[:error] = 'Não foi possível cadastrar preço'
      render :new
    end
  end

  def show
    @category_price = CategoryPrice.find(params[:id])
  end

  private

  def category_prices_param
    params.require(:category_price)
          .permit(:category_id, :rental_period, :price)
  end
end
