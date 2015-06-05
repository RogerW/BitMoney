class InvoicesController < ApplicationController
  before_action :authenticate_user!
   
  respond_to :json

  def index
    load_invoices

  end

  def show
    load_invoice or render json: {message:"Can't find invoice"}, status: 404
  end

  # def new
  #   @invoice = Invoice.new
  #   respond_with(@invoice)
  # end

  # def edit
  # end

  # def create
  #   @invoice = Invoice.new(invoice_params)
  #   @invoice.save
  #   respond_with(@invoice)
  # end

  def update
    load_invoice
    build_invoice
    save_invoice or render json: {:errors => @invoice.errors.full_messages}, status: 422
  end

  def destroy
    load_invoice
    
    if @invoice.destroy
      render json: {message: "Запись удалена!"}, status: 200
    else
      render json: {:errors => @invoice.errors.full_messages}, status: 422
    end
    
  end

  private
    def load_invoices
      @invoices ||= invoice_scope.to_a
    end
    
    def load_invoice
      @invoice ||= invoice_scope.where(id: params[:id]).first
    end
    
    def build_invoice
      @invoice ||= account_scope.build
      @invoice.attributes = invoice_params
    end
    
    def save_invoice
      if @invoice.save
        render json: @invoice, status: 200
      end
    end
  
    def invoice_scope
      page = params[:page].present? ? params[:page] : 1
      if page == '0'
        invoice_scope = current_user.admin? ? Invoice.where(nil) : current_user.invoices.includes(:consumption_types, :account).references(:consumption_types, :account).paginate(:page => 1, :per_page => Invoice.count).order('invoices.created_at DESC')
      else
        invoice_scope = current_user.admin? ? Invoice.where(nil) : current_user.invoices.includes(:consumption_types, :account).references(:consumption_types, :account).paginate(:page => page, :per_page => 15).order('invoices.created_at DESC')
      end

      if params[:account_id].present?
        invoice_scope = invoice_scope.where(account_id:params[:account_id])
      end

      if params[:start_date].present?
        invoice_scope = invoice_scope.where("invoices.created_at >= ?", Time.parse(params[:start_date]))
      end

      if params[:end_date].present?
        invoice_scope = invoice_scope.where("invoices.created_at <= ?", Time.parse(params[:end_date]))
      end
      
      if params[:find_text].present?
        invoices = Invoice.arel_table
        find_text = "%#{params[:find_text]}%"
        invoice_scope = invoice_scope.where(invoices[:note].matches(find_text))
      end

      # puts invoice_scope.to_sql

      return invoice_scope
    end
    
    def invoice_params
      params.require(:invoice).permit(:account_id, :amount, :note, :consumption_type_id)
    end
end
