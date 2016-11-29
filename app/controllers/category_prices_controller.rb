class CategoryPricesController < ApplicationController
  def new
    @category_prices = CategoryPrice.new
    @categories = Category.all
  end
end
