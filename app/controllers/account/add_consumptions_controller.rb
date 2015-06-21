class Account::AddConsumptionsController < ApplicationController
  before_action :authenticate_user!
  include Pundit
  
  def new
    build_add_counsumption
  end
  
  def create
    build_add_counsumption
    authorize @add_consumption
    if @add_consumption.save
      render json: @add_consumption, status: 200
    else
      render json: @add_consumption, status: 500
    end
  end
  
  private 
  def build_add_counsumption
    @add_consumption ||= Account::AddConsumption.new(add_consumption_params)
  end
  
  def add_consumption_params
	  add_consumption_params = params[:account_add_consumption]
	  add_consumption_params[:account_id] ? {} :add_consumption_params[:account_id] = params[:account_id]
	  add_consumption_params ? add_consumption_params.permit(:account_id, :amount, :note, :consumption_type_id) : {}
  end
end
