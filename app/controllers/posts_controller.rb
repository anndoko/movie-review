class PostsController < ApplicationController
before_action :authenticate_user!, :only => [:new, :create]

def new
  @movie = Movie.find(params[:movie_id])
  @post = Post.new

  if !current_user.is_member_of?(@movie)
    redirect_to movie_path(@movie), alert: "This movie is not in your favorite."
  end
end

def create
  @movie = Movie.find(params[:movie_id])
  @post = Post.new(post_params)
  @post.movie = @movie
  @post.user = current_user

  if @post.save
    redirect_to movie_path(@movie)
  else
    render :new
  end
end

private

  def post_params
    params.require(:post).permit(:content)
  end

end
