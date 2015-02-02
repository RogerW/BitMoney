class ConsumptionsController < ApplicationController
  before_action :set_consumption, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @consumptions = Consumption.all
    respond_with(@consumptions)
  end

  def show
    respond_with(@consumption)
  end

  def new
    @consumption = Consumption.new
    respond_with(@consumption)
  end

  def edit
  end

  def create
    @consumption = Consumption.new(consumption_params)
    @consumption.save
    respond_with(@consumption)
  end

  def update
    @consumption.update(consumption_params)
    respond_with(@consumption)
  end

  def destroy
    @consumption.destroy
    respond_with(@consumption)
  end

  private
    def set_consumption
      @consumption = Consumption.find(params[:id])
    end

    def consumption_params
      params.require(:consumption).permit(:invoice_id, :consumption_type_id)
    end
end
