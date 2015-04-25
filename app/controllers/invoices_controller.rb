class InvoicesController < ApplicationController
  before_action :authenticate_user!
   
  respond_to :json

  def index
    load_invoices

  end

  def show
    load_invoice or render json: {notice:"Can't find invoice"}, status: 404
  end

  def new
    @invoice = Invoice.new
    respond_with(@invoice)
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save
    respond_with(@invoice)
  end

  def update
    @invoice.update(invoice_params)
    respond_with(@invoice)
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
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
  
    def invoice_scope
      page = params[:page].present? ? params[:page] : 1
      current_user.admin? ? Invoice.where(nil) : current_user.invoices.includes(:consumption_types).references(:consumption_types).paginate(:page => page, :per_page => 15).order('invoices.created_at DESC')
    end
    
    def invoice_params
      params.require(:invoice).permit(:account_id, :amount, :note)
    end
end
