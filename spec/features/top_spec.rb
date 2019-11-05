require "rails_helper"

describe 'トップページ' do
  specify "画面の表示" do
    visit "/"
    expect(page).to have_css("h1",text: "サンクスツイート")
  end
end