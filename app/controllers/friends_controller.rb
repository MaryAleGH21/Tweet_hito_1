class HomesController < ApplicationController
    before_action :authenticate_user!, except: %i[ index]    
    
    def create
    
        @friend = Friend.new(friend_params)
        @friend.user_id = current_user.id
        respond_to do |format|
          if @friend.save
            format.html { redirect_to @tweet, notice: "" }
             
              else
               format.html { render :new, status: :unprocessable_entity }  
              end 
          end
        end
    
  end

  
