require 'rails_helper'

RSpec.describe "invoices/index", :type => :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :account => nil,
        :amount => "",
        :note => "Note"
      ),
      Invoice.create!(
        :account => nil,
        :amount => "",
        :note => "Note"
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
