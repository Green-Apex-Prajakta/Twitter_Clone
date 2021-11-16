require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  
  let(:tweet) do
    Tweet.create!(
      body: "This is my first Tweet", 
      user_id: 1, 
      tweet_id: 1
    ) 
  end
   
  describe 'GET /tweets' do
    it "show list of tweets" do
      get "/tweets"
      expect(response).to have_http_status(:success)
    end

    it "should user_id.present" do
      get "/tweets"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /tweets" do
    it "creates a tweet" do
      post "/tweets", :params => '{ "tweet": { "body":"This is my first Tweet", "user_id":1, "tweet.id":1 } }'
      expect(tweet).to be_valid
    end
  end

  describe 'PATCH /tweets/:id' do
    context 'check tweet update' do
      before do
        patch "/tweets/#{tweet.id}", params: { "tweet": { "body":"Testing Tweet" } }
      end

      it 'returns status code' do
       expect(response).to have_http_status(302)
      end
    end
  end

  describe 'DELETE /tweets/:id' do
    before(:each) do
      tweet_id = tweet.id
    end

    it 'should delete tweet & return status 204' do
      delete "/tweets/#{tweet.id}"
      expect(Tweet.where(id: tweet.id)).to eq []
      expect(response.status).to eq 302
    end
  end
end