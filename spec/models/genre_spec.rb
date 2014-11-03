require 'rails_helper'

RSpec.describe Genre, :type => :model do

  let(:productivity) {
    Genre.new({name: "Productivity"})
  }

  it "should only allow a genre to be created if it has a name" do
    expect(productivity).to be_valid
  end

end
