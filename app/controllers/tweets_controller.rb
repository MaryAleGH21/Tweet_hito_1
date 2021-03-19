class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ver_hashtag ]
  #  before_action :set_like, only: %i[ show create destroy ]
  # GET /tweets or /tweets.json
  before_action :authenticate_user!, except: %i[ index ]
  

 
  def index 
    @q = params[:q]
    
    if @q
     @tweets = Tweet.where("content ILIKE ?" , "%#{@q}%" ).page(params[:page]).paginate(page: params[:page], per_page:50)
     
    else
      tweets = user_signed_in? ? Tweet.tweets_for_me(current_user.friends.map{|friend|friend.friend_id }) : Tweet.all
      @tweets = tweets.page(params[:page]).paginate(page: params[:page], per_page:50)
    end
      
   
    # GET /tweets/1 or /tweets/1.json
  end 

  def show
    
  end

  def retweet
      @tweet.retweets.create(user_id: current_user, content: "")
      if @tweet.save
        redirect_to root_path
      end
    

  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    
  end


  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
          else
           format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @tweet.errors, status: :unprocessable_entity }
          end 
      end
    end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:user_id, :content, :page)
    end
  end 