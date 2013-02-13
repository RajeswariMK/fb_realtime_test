class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    p current_user, "-----------"
    if current_user
      @graph = Koala::Facebook::API.new(current_user.oauth_token)
      @post = @graph.get_connections("me", "feed")
    else 
      @post = []  
    end
    # p @post, ":---------------------------------------:"
    p @post.size, ":----------------"
    # @updates = Koala::Facebook::RealtimeUpdates.new(:app_id => '141213822708267', :secret => 'f9b95f55474f790335c44f4be592ec26')
    # p @updates.list_subscriptions, "------------------------"
    # @updates.subscribe("likes","friends", 'http://192.168.43.236:3000/callback', 'my_realtime_verify')
    # @updates = Koala::Facebook::RealtimeUpdates.new(:app_id => '141213822708267', :secret => 'f9b95f55474f790335c44f4be592ec26')
    # @updates.subscribe("user", "likes", 'http://fb-realtime-test.herokuapp.com/facebook/subscription', 'stringToken')
    # Rails.logger.info(@updates.list_subscriptions)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def create_page_posts(fb_page_id, token, facebook_info)
    begin
      posts = RestClient.get("https://graph.facebook.com/#{fb_page_id}/posts?access_token=#{token}&limit=20&offset=0")
      parsed_posts = JSON.parse(posts)["data"]
     
      if parsed_posts && parsed_posts.size > 0
        parsed_posts.each do |post|
          begin
            post_type = post["type"]
            if post.has_key?("object_id")
              picture_post = RestClient.get("https://graph.facebook.com/#{post["object_id"]}?#{token}")
              parsed_picture_post = JSON.parse(picture_post)
              if parsed_picture_post.has_key?("images")
                picture_url = parsed_picture_post["images"][4]["source"]
                Post.posts_data(post, picture_url,post_type, facebook_info)
              end
            else
              Post.posts_data(post, post["picture"], post_type, facebook_info)
            end
          rescue => ex
            ErrorLog "create_page_posts: Exception creating post, fb_page_id=#{fb_page_id};post=#{post};Exception=#{ex}"
          end       
        end
      end
    rescue  => ex1
      ErrorLog "create_page_posts: Exception creating posts entries, fb_page_id=#{fb_page_id};Exception=#{ex1}"
    end
  end
end
