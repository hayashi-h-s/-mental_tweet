class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post =  Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to posts_path,notice: "投稿完了しました。"
    else   
      render :new
    end
  end 
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path,notice: "投稿内容を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path,notice: "コンテンツ『#{@post.content}』を削除しました。"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :video, :image)
  end
end
