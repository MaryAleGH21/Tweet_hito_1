class Tweet < ApplicationRecord
   validates :content, presence:true
   belongs_to :user
   has_many :likes
   has_many :retweets, class_name: "Tweet", foreign_key: "retweet_id"
   belongs_to :retweet, class_name: "Tweet", optional: true 

   scope :tweets_for_me, ->(friends_ids) {where(user_id: friends_ids)}
   
   data = Tweet.all
   @contenido = data.map{|friend|friend.content }
   
  def ver_hashtag()
    #contenido = Tweet.params[:content]
    contenido.split(" ").each do |x|
      
     end 
   end 
  
end
