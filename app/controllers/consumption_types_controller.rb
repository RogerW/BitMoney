class ConsumptionTypesController < ApplicationController
  before_action :set_consumption_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @consumption_types = ConsumptionType.all
    respond_with(@consumption_types)
  end

  def show
    respond_with(@consumption_type)
  end

  def new
    @consumption_type = ConsumptionType.new
    respond_with(@consumption_type)
  end

  def edit
  end

  def create
    @consumption_type = ConsumptionType.new(consumption_type_params)
    @consumption_type.save
    respond_with(@consumption_type)
  end

  def update
    @consumption_type.update(consumption_type_params)
    respond_with(@consumption_type)
  end

  def destroy
    @consumption_type.destroy
    respond_with(@consumption_type)
  end

  private
    def set_consumption_type
      @consumption_type = ConsumptionType.find(params[:id])
    end

    def consumption_type_params
      params.require(:consumption_type).permit(:title, :user_id)
    end
end
