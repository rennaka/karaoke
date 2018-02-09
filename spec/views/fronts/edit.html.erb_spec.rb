require 'rails_helper'

RSpec.describe "fronts/edit", type: :view do
  before(:each) do
    @front = assign(:front, Front.create!())
  end

  it "renders the edit front form" do
    render

    assert_select "form[action=?][method=?]", front_path(@front), "post" do
    end
  end
end
