class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @posts = Post.new
  end

  def create
    @posts =  Post.new(Post_params.merge(user_id: current_user.id))
    @posts.save!
    redirect_to Posts_path,notice: "コンテンツ『#{@Post.content}』を投稿しました。"
  end

  def destroy
    @posts = Content.find(params[:id])
    @posts.destroy!
    redirect_to Posts_path,notice: "コンテンツ『#{@Post.content}』を削除しました。"
  end

  def edit
  end

  def show
    @posts = Post.find(params[:id])
  end

  private

  def content_params
    params.require(:post).permit(:content,:video)
  end
end
