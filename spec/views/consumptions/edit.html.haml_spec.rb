require 'rails_helper'

RSpec.describe "consumptions/edit", :type => :view do
  before(:each) do
    @consumption = assign(:consumption, Consumption.create!(
      :invoice => nil,
      :consumption_type => nil
    ))
  end

  it "renders the edit consumption form" do
    render

    assert_select "form[action=?][method=?]", consumption_path(@consumption), "post" do

      assert_select "input#consumption_invoice_id[name=?]", "consumption[invoice_id]"

      assert_select "input#consumption_consumption_type_id[name=?]", "consumption[consumption_type_id]"
    end
  end
end
