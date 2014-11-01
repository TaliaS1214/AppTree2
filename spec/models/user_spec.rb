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

  it "should be able to upvote an app" do
    sean.upvote_app(twitter)
    expect(sean.upvoted_apps).to include(twitter)
  end

  xit "should be able to downvote an app" do
    sean.upvote_app(twitter)
    sean.downvote_app(twitter)
    expect(sean.upvoted_apps).to !include(twitter)
  end

end
