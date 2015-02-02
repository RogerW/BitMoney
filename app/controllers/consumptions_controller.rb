class ConsumptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_consumptions
  end

  def show
    load_consumption
  end

  def edit
    load_consumption
    build_consumption
  end

  def new
    build_consumption
  end

  def update
    load_consumption
    build_consumption
    save_consumptions
  end

  def destroy
    load_consumption
    @consumption.destroy
    redirect_to consumption_path
  end


  private

  def consumption_scope
    current_user.admin? ? Consumption.where(nil) : current_user.accounts
  end

  def consumption_params
    consumption_params = params[:consumption]
    consumption_params ? account_params.permit(:consumption_type_id, :invoice_id) : {}
  end

  def load_consumption
    @consumption ||= consumption_scope.to_a
  end

  def load_consumptions
    @consumptions ||= consumption_scope.where(id: params[:id]).first
  end

  def build_consumption
    @consumption ||= consumption_scope.build
    @consumption.attributes = consumption_params
  end

  def save_consumptions
    if @consumption.save
      redirect_to @consumption
    end
  end
end
