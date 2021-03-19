class LikesController < ApplicationController
    def create
        @tweet = Tweet.find(params[:tweet_id])
        @like = Like.new(user: current_user,tweet: @tweet)
                
       if @like.save
           redirect_to tweets_url, notice: "like save." 
            
         else
          redirect_to @tweet, notice: "No save."  
        end
    end

    def destroy
      @like = Like.find params[:id] 
        @like.destroy
        respond_to do |format|
          format.html { redirect_to tweets_url, notice: "like was successfully destroyed." }
          format.json { head :no_content }
        end
   end
  end


  