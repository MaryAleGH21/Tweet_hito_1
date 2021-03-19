class Tweet < ApplicationRecord
   validates :content, presence:true
   belongs_to :user
   has_many :likes
   has_many :retweets, class_name: "Tweet", foreign_key: "retweet_id"
   belongs_to :retweet, class_name: "Tweet", optional: true 


  #palabra =  Tweet.pa
  
 #def ver_hashtag
  # palabla.split("").each do |x|
   #  if x = #
       
    # end
   #end
 #end 




end
