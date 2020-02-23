require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー新規登録時のヴァリデーション機能" do
    it "値が入っている場合" do
      expect(@user).to be_valid
    end
    it "emailが空白の場合" do
      @user.email = " "
      expect(@user).to be_invalid
    end
  
    it "一意性が正しく機能しているか" do
      #@userを複製してduplicate_userに格納
      duplicate_user = @user.dup
      #@userのemailを大文字でduplicate_userのemailに格納
      duplicate_user.email = @user.email
      @user.save!
      expect(duplicate_user).not_to be_valid
    end

    it "passwordが空白になっていないか" do
      #" "* 6だけだと何をテストしているのか曖昧なため、"a"*6の場合のテストも追加
      #"a"が6文字のパスワードのテスト
      @user.password = @user.password_confirmation = "a" * 6
      expect(@user).to be_valid

      #" "が６文字のパスワードのテスト
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to_not be_valid
    end        
  end

    #パスワードが6桁の時と５桁の時のテストを行うことで、どの位置からバリデーションが用意されているのか可視化している
    context "パスワードが６桁の時" do
      it "正しい" do
        @user = FactoryBot.build(:user, password: "a" * 6,password_confirmation: "a" * 6)
        expect(@user).to be_valid
      end
    end

    context "パスワードが５桁の時" do
      it "正しくない" do
        @user = FactoryBot.build(:user, password: "a" *5, password_confirmation: "a" * 5)
        expect(@user).to be_invalid
      end
    end
end