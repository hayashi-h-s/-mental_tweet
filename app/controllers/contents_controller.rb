class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.save!
    redirect_to contents_path,notice: "コンテンツ『#{@content.title}』を投稿しました。"
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy!
    redirect_to contents_path,notice: "コンテンツ『#{@content.title}』を削除しました。"
  end

  def edit
  end

  def show
    @content = Content.find(params[:id])
  end

  private

  def content_params
    params.require(:content).permit(:title,:video)
  end
end
