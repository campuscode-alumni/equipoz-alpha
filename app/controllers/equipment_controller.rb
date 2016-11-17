class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(params_equipment)
    @equipment.save
    redirect_to @equipment
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  private

  def params_equipment
    params.require(:equipment).permit(:description, :category, :serial_number, :acquisition_date, :replacement_value, :usage_limit)
  end
end
