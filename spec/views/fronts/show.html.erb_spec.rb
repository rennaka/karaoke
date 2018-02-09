require 'rails_helper'

RSpec.describe "fronts/show", type: :view do
  before(:each) do
    @front = assign(:front, Front.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
