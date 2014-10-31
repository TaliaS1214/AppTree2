require 'rails_helper'

RSpec.describe App, :type => :model do

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

  let(:bad_twitter) {
    App.new({
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
    })
  }

  let!(:utilities) {
    Genre.create!({
      name: 'utilities'
    })
  }

  let!(:social_networking) {
    Genre.create!({
      name: "social networking"
    })
  }

  it "should not let an app be created with any of the database table columns empty" do
    expect(twitter).to be_valid
  end

  it "should be able to assign it genres based on its tags" do
    twitter.add_genres
    expect(twitter.genres).to include(utilities, social_networking)
  end

  it "should set upvote count and popularity score to 0 on creation" do
    expect(twitter.upvote_count).to eq(0)
  end

end
