require 'rails_helper'

RSpec.describe "consumptions/new", :type => :view do
  before(:each) do
    assign(:consumption, Consumption.new(
      :invoice => nil,
      :consumption_type => nil
    ))
  end

  it "renders new consumption form" do
    render

    assert_select "form[action=?][method=?]", consumptions_path, "post" do

      assert_select "input#consumption_invoice_id[name=?]", "consumption[invoice_id]"

      assert_select "input#consumption_consumption_type_id[name=?]", "consumption[consumption_type_id]"
    end
  end
end
