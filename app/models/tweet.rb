class Tweet < ApplicationRecord
   validates :content, presence:true
   belongs_to :user
   has_many :likes
   has_many :retweets, class_name: "Tweet", foreign_key: "retweet_id"
   belongs_to :retweet, class_name: "Tweet", optional: true 

   scope :tweets_for_me, ->(friends_ids) {where(user_id: friends_ids)}
   


  #contenido =  Tweet.params[:content]
  #@q = Tweets.params[:content]
  puts "_______________----------------___________"
  
 def ver_hashtag
   contenido = params[:content]
   puts contenido 
  # palabla.split("").each do |x|
   #  if x = #
       
    # end
   #end
 end 




end
