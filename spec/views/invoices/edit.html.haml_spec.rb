require 'rails_helper'

RSpec.describe "invoices/edit", :type => :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :account => nil,
      :amount => "",
      :note => "MyString"
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input#invoice_account_id[name=?]", "invoice[account_id]"

      assert_select "input#invoice_amount[name=?]", "invoice[amount]"

      assert_select "input#invoice_note[name=?]", "invoice[note]"
    end
  end
end
