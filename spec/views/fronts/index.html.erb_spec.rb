require 'rails_helper'

RSpec.describe "fronts/index", type: :view do
  before(:each) do
    assign(:fronts, [
      Front.create!(),
      Front.create!()
    ])
  end

  it "renders a list of fronts" do
    render
  end
end
