json.extract! tweet, :id, :user_id, :content, :photo, :likes, :retweets, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
