class Tweet < ApplicationRecord
   validates :content, presence:true
   belongs_to :user
   has_many :likes
   has_many :retweets, class_name: "Tweet", foreign_key: "retweet_id"
   belongs_to :retweet, class_name: "Tweet", optional: true 

   scope :tweets_for_me, ->(friends_ids) {where(user_id: friends_ids)}
   
   data = Tweet.all
   @contenido = data.map{|friend|friend.content }
   
  def content_with_hashtag
  new_content = self. content.split(" ").map do |word|
    if word.include?("#")
      "<a href='/?q='#{word}'>#{word}</a>"
      end 
    end
    new_content.join(' ').html_safe
  end
end
