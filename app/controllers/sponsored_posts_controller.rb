class SponsoredPostsController < ApplicationController
  def show
  end

  def new
    @sponsored_post = Sponsored_post.new #Sponsored_post or Sponsored_Post?
  end

  # def create
  #   @sponsored_post = Sponsored_post.new
  #   @sponsored_post.title = params[:sponsored_post][:title]
  #   @sponsored_post.body = params[:post][:body]
  #
  #   if @sponsored_post.save
  #     flash[:notice] = "Sponsored post was saved."
  #     redirect_to @sponsored_post
  #   else
  #     flash.now[:alert] = "There was an error saving the post. Please try again."
  #     render :new
  #   end
  # end

  def edit
  end

end
