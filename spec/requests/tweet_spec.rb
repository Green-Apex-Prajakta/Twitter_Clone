require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  
  before(:each) do
    @tweet = Tweet.create(body: "This is my first Tweet", user_id: 1 , tweet_id: 1)
  end

  it 'checks that a tweet can be created' do
      expect(@tweet).to be_valid
  end

  it 'checks that a tweet can be updated' do
    @tweet.update(:body => "My sweet tweet")
    expect(Tweet.find_by_body("My sweet tweet")).to eq(@tweet)
  end

  it 'checks that a retweet the tweet' do
    expect(Tweet.find_by_id(1)) == (@tweet)
  end

  it 'checks that a tweet can be destroyed' do
    @tweet.destroy
    expect(Tweet.find_by(body: "My sweet tweet")).to be_nil
  end
end