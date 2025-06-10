class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.create(post_params)
    band_member = BandMember.find_by(user_id: current_user.id)
    if band_member
      @post.band_id = band_member.band_id
    else
      @post.user_id = current_user.id
    end

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      redirect_to posts_path, alert: 'Unable to create post, try again.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end
end
