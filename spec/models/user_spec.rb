require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:sean) {
    User.new({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: 'CapybaraIsCool12345',
      phone_number: '2482026504'
      })
  }

  let(:second_sean) {
    User.new({
      first_name: 'Sean',
      last_name: 'Jennings',
      email: 'talias432@gmail.com',
      password: 'Wow',
      phone_number: '0123456789'
      })
  }

  let(:najee) {
    User.new({
      first_name: 'Najee',
      last_name: 'Gardner',
      password: 'MeowMeow',
      phone_number: '0123456789'
      })
  }

  it "should allow a user to be made if they have an email and password" do
    expect(sean).to be_valid
  end

  it "should not allow duplicate emails" do
    sean.save
    expect(second_sean).to_not be_valid
  end

  it "should not allow a user to be created without an email" do
    expect(najee).to_not be_valid
  end

end
