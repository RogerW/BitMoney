require 'rails_helper'

RSpec.describe "invoices/show", :type => :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :account => nil,
      :amount => "",
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Note/)
  end
end
