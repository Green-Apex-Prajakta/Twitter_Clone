require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject { described_class.new(user_id: 1, body: "My first book publish", tweet_id: 1) }

  describe 'create' do
    it 'should be tweet id & body present' do
     expect(subject) == "quote-tweet"
    end  

    it 'should be tweet id present' do
     expect(subject) == "retweet"
    end 

    it 'should be tweet id & body not present' do
     expect(subject) == "tweet"
    end 
  end
end