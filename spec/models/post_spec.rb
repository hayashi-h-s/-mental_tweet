require 'rails_helper'

RSpec.describe Post, type: :model do
  # before do
  #   @user = FactoryBot.build(:user)
  #   FactoryBot.create(:post, content: "最初の投稿", user: @user)
  # end


  context "ユーザーAがログインしてる時  " do

    # before do 
    #   visit login_path
    #   fill_in 'メールアドレス',with: 'test@example.com'
    #   fill_in 'パスワード',with: 'passord'
    #   click_button 'ログイン'
    # end

    # it "ユーザーAが作成したタスクが表示される" do
    #   expect(page).to have_content '最初のタスク'
    # end

    it "内容が空白の場合、無効になること" do
      post.content = " "
      expect(post).to be_invalid
    end
  end
end
