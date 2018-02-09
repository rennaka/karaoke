require 'rails_helper'

RSpec.describe "fronts/new", type: :view do
  before(:each) do
    assign(:front, Front.new())
  end

  it "renders new front form" do
    render

    assert_select "form[action=?][method=?]", fronts_path, "post" do
    end
  end
end
