class ConsumptionTypesController < ApplicationController
	before_action :authenticate_user!

  def index
	  load_consumption_types
  end

  def show
	  load_consumption_type
  end

  def new
	  build_consumption_type
  end

  def edit
	  load_consumption_types
  end

  def create
	  build_consumption_type
	  save_consumption_type or render json: @consumption_type, status: 500
  end

  def update
	  load_consumption_type
	  build_consumption_type
	  save_account or render json: @consumption_type, status: 500
  end

  def destroy
	  load_consumption_type
	  @consumption_type.destroy or render json: @consumption_type, status: 500
  end

  private
    def load_consumption_type
	    @consumption_type ||= consumption_type_scope.where(id: params[:id]).first
    end

		def load_consumption_types
			@consumption_types ||= consumption_type_scope.to_a
		end

		def build_consumption_type
			@consumption_type ||= consumption_type_scope.build
			@consumption_type.attributes = consumption_type_params
		end

		def save_consumption_type
			if @consumption_type.save
				render json: @consumption_type, status: 200
			end
		end

		def consumption_type_params
			consumption_type_params = params[:consumption_type]
			if current_user.admin?

				if consumption_type_params
					consumption_type_params[:user_id].nil? ? consumption_type_params[:user_id] = current_user.id : {}
				end

				consumption_type_params ? consumption_type_params.permit(:title, :icon, :user_id) : {}
			else
				consumption_type_params ? consumption_type_params.permit(:title, :icon) : {}
			end


		end

		def consumption_type_scope
			current_user.admin? ? ConsumptionType.where(nil) : current_user.consumption_types
		end

end
