require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:sean) {
    User.create!({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: 'CapybaraIsCool12345',
      password_confirmation: 'CapybaraIsCool12345',
      phone_number: '15555555555'
    })
  }

  let!(:twitter) {
    App.create!({
      name: "Twitter",
      tags: "Social Networking,Utilities",
      screenshot_urls: "http://a1.mzstatic.com/us/r30/Purple3/v4/68/e8/ef/...",
      release_date: "10/09/2009",
      creator: "Twitter, Inc.",
      price: 0,
      small_avatar_url: "http://a1058.phobos.apple.com/us/r30/Purple3/v4/c9...",
      large_avatar_url: "http://a1767.phobos.apple.com/us/r30/Purple1/v4/c9...",
      track_view_url: "https://itunes.apple.com/us/app/twitter/id33390327...",
      description: "Twitter is a free app that lets you connect with p...",
      itunes_id: 333903271
    })
  }

  it "should allow a user to be made if they have an email, password, first_name, and last_name" do
    expect(sean).to be_valid
  end

  it "should not allow a user be made if password does not match password confirmation" do
    bad_user = User.new({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: 'thepassword',
      password_confirmation: 'notamatch',
      phone_number: '15555555555'
    })

    expect(bad_user).to_not be_valid

  end

  it "should not allow duplicate emails" do
    expect(sean).to validate_uniqueness_of(:email)
  end

  it "should not allow a user to be created without a first_name" do
    expect(sean).to validate_presence_of(:first_name)
  end

  it "should not allow a user to be created without a last_name" do
    expect(sean).to validate_presence_of(:last_name)
  end

  it "should not allow a user to be created without an email" do
    expect(sean).to validate_presence_of(:email)
  end

  it "should not allow a user to be created without a password" do
    bad_user = User.new({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: '',
      password_confirmation: 'blah',
      phone_number: '15555555555'
    })

    expect(bad_user).to_not be_valid
  end

  it "should not allow a user to be created without a password confirmation" do
    expect(sean).to validate_presence_of(:password_confirmation)
  end

  it "should not allow a user to be created with a password that is less than 8 characters long" do
    bad_user = User.new({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: '1234567',
      password_confirmation: '1234567',
      phone_number: '2482026504'
    })

    expect(bad_user).to_not be_valid
  end

  it "should only allow a phone number to be saved if it has the format '12345678'" do
    bad_user = User.new({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: '12345678',
      password_confirmation: '12345678',
      phone_number: '24820'
    })

    expect(bad_user).to_not be_valid
  end

  it "should be able to upvote an app" do
    sean.upvote_app(twitter)
    expect(sean.upvoted_apps).to include(twitter)
  end

  it "should be able to downvote an app" do
    sean.upvote_app(twitter)
    sean.downvote_app(twitter)
    expect(sean.upvoted_apps).to eq([])
  end

end
