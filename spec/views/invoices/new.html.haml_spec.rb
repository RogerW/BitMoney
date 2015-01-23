require 'rails_helper'

RSpec.describe "invoices/new", :type => :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :account => nil,
      :amount => "",
      :note => "MyString"
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input#invoice_account_id[name=?]", "invoice[account_id]"

      assert_select "input#invoice_amount[name=?]", "invoice[amount]"

      assert_select "input#invoice_note[name=?]", "invoice[note]"
    end
  end
end
