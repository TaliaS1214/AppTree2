require 'rails_helper'

RSpec.describe App, :type => :model do

  let!(:twitter) {
    App.create!({
        :itunes_id=>333903271,
       :name=>"Twitter",
       :tags=>"Social Networking,Utilities",
       :screenshot_urls=>
        "http://a3.mzstatic.com/us/r30/Purple3/v4/3e/f0/b1/3ef0b1b9-b5da-1ec9-9699-65117ebd0d22/screen1136x1136.jpeg,http://a2.mzstatic.com/us/r30/Purple1/v4/61/6d/84/616d8403-e143-f12c-ecb4-0f831dbc8fb2/screen1136x1136.jpeg,http://a5.mzstatic.com/us/r30/Purple3/v4/4b/05/08/4b0508c8-8331-96c7-b0d7-b53a52ed300f/screen1136x1136.jpeg,http://a5.mzstatic.com/us/r30/Purple3/v4/08/b9/44/08b94429-6bff-7915-b087-bbee7e794933/screen1136x1136.jpeg",
       :release_date=>"10/09/2009",
       :creator=>"Twitter, Inc.",
       :price=>0.0,
       :small_avatar_url=>
        "http://a65.phobos.apple.com/us/r30/Purple3/v4/e6/ed/6e/e6ed6e4d-efef-920d-8fe9-b8691a16af99/ProductionAppIcon57x57.png",
       :large_avatar_url=>
        "http://a1981.phobos.apple.com/us/r30/Purple1/v4/e6/11/22/e61122bb-2232-1bdc-0fc9-50cfd62b90b8/mzl.nspplrwj.png",
       :track_view_url=>"https://itunes.apple.com/us/app/twitter/id333903271?mt=8&uo=4",
       :description=>
        "Twitter is a free app that lets you connect with people, express yourself, and discover more about all the things you love.\n\nSee what your favorite celebs and athletes are chatting about. Be the first to hear breaking news. Catch a glimpse behind the scenes at concerts, sporting events, and more.\n\nThen join the conversation: Tweet your own text, photos, and video to your followers — and maybe make a few fans along the way.\n\nGet inspired. Be social. Even send private messages to friends. All in real time, as big (and little) things happen, from anywhere you happen to be."
    })
  }

  let!(:bad_twitter) {
    App.new({
       :name=>"Twitter",
       :tags=>"Social Networking,Utilities",
       :screenshot_urls=>
        "http://a3.mzstatic.com/us/r30/Purple3/v4/3e/f0/b1/3ef0b1b9-b5da-1ec9-9699-65117ebd0d22/screen1136x1136.jpeg,http://a2.mzstatic.com/us/r30/Purple1/v4/61/6d/84/616d8403-e143-f12c-ecb4-0f831dbc8fb2/screen1136x1136.jpeg,http://a5.mzstatic.com/us/r30/Purple3/v4/4b/05/08/4b0508c8-8331-96c7-b0d7-b53a52ed300f/screen1136x1136.jpeg,http://a5.mzstatic.com/us/r30/Purple3/v4/08/b9/44/08b94429-6bff-7915-b087-bbee7e794933/screen1136x1136.jpeg",
       :release_date=>"10/09/2009",
       :creator=>"Twitter, Inc.",
       :price=>0.0,
       :small_avatar_url=>
        "http://a65.phobos.apple.com/us/r30/Purple3/v4/e6/ed/6e/e6ed6e4d-efef-920d-8fe9-b8691a16af99/ProductionAppIcon57x57.png",
       :large_avatar_url=>
        "http://a1981.phobos.apple.com/us/r30/Purple1/v4/e6/11/22/e61122bb-2232-1bdc-0fc9-50cfd62b90b8/mzl.nspplrwj.png",
       :track_view_url=>"https://itunes.apple.com/us/app/twitter/id333903271?mt=8&uo=4",
       :description=>
        "Twitter is a free app that lets you connect with people, express yourself, and discover more about all the things you love.\n\nSee what your favorite celebs and athletes are chatting about. Be the first to hear breaking news. Catch a glimpse behind the scenes at concerts, sporting events, and more.\n\nThen join the conversation: Tweet your own text, photos, and video to your followers — and maybe make a few fans along the way.\n\nGet inspired. Be social. Even send private messages to friends. All in real time, as big (and little) things happen, from anywhere you happen to be."
    })
  }

  let!(:dark_sky) {
    App.create!({
     :itunes_id=>517329357,
     :name=>"Dark Sky - Weather Radar, Hyperlocal Forecasts, and Storm Alerts",
     :tags=>"Weather,Utilities",
     :screenshot_urls=>
      "http://a5.mzstatic.com/us/r30/Purple3/v4/e8/eb/61/e8eb6177-b5ad-6e69-a698-939f54d929be/screen1136x1136.jpeg,http://a1.mzstatic.com/us/r30/Purple3/v4/dc/08/80/dc0880b2-9288-13b4-45b0-f2016f06b440/screen1136x1136.jpeg,http://a4.mzstatic.com/us/r30/Purple3/v4/0c/18/6e/0c186e4e-636e-8b15-888e-66ac12969dd6/screen1136x1136.jpeg,http://a3.mzstatic.com/us/r30/Purple5/v4/59/1b/da/591bda0e-914c-9c40-c026-361dc2ca178e/screen1136x1136.jpeg,http://a1.mzstatic.com/us/r30/Purple5/v4/75/7c/c9/757cc9f3-6606-9346-5bd0-7ab402f4e7ea/screen1136x1136.jpeg",
     :release_date=>"04/16/2012",
     :creator=>"Jackadam",
     :price=>399,
     :small_avatar_url=>
      "http://a1746.phobos.apple.com/us/r30/Purple1/v4/cb/d6/bb/cbd6bb6e-44ae-fe2b-de52-9a1c5ef43c8f/Icon120.png",
     :large_avatar_url=>
      "http://a73.phobos.apple.com/us/r30/Purple3/v4/d6/10/df/d610df54-a5ae-a834-8e80-d49e17cb54a3/mzl.nxssjqut.png",
     :track_view_url=>"https://itunes.apple.com/us/app/dark-sky-weather-radar-hyperlocal/id517329357?mt=8&uo=4",
     :description=>
      "Dark Sky can tell you at a glance exactly when it will rain (or snow) up to an hour in advance, so you’re free to walk the dog or run out to lunch and know you’ll stay dry. You can also explore the most beautiful weather animation you’ve ever seen, both forward in time or back. \n\n(Dark Sky is available in the US, UK and Ireland.)\n\nYOUR WEATHER, DOWN TO THE MINUTE \nUsing GPS, Dark Sky is able to create forecasts for your precise location, giving you minute-to-minute predictions for the next hour and detailed forecasts for the next day and week.\n\nBEAUTIFUL WEATHER ANIMATIONS \nThe same technology that powers Dark Sky’s predictions also allows us to make the world’s first perfectly smooth radar animation. Other apps show you a chunky slideshow that makes it nearly impossible to tell how storms are moving. But Dark Sky’s radar animation lets you see the actual path of the storm: how it moved in the past, and where it’s going in the future. \n\nPUSH NOTIFICATIONS \nDark Sky can send you an alert before it starts raining at your exact location. Even if you haven't opened the app in days, Dark Sky will know when you're in the path of a storm. \n\nTODAY WIDGET\nThe Dark Sky Notification Center Widget tells you at a glance what's going to happen in the next hour, so you don't even have to unlock your phone to quickly check the weather before heading out."
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

  let(:sean) {
    User.create!({
      first_name: 'Sean',
      last_name: 'Talia',
      email: 'talias432@gmail.com',
      password: 'CapybaraIsCool12345',
      password_confirmation: 'CapybaraIsCool12345',
      phone_number: '2482026504'
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

  it "should increase upvote_count after user upvotes it" do
    sean.upvote_app(twitter)
    expect(twitter.upvote_count).to eq(1)
  end

end
