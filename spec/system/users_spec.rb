require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content("新規登録")
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "Nickname", with: @user.nickname
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      fill_in "Password confirmation", with: @user.password_confirmation
      fill_in "favorite_id", with: @user.favorite_id
      fill_in "have_pet_id", with: @user.have_pet_id
      fill_in "pet_name", with: @user.pet_name
      # サインアップボタンを押すとユーザーモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # カーソルを合わせるとログアウトボタンが表示される
      expect(
        find(".user_nav").find("span").hover
      ).to have_content("ログアウト") 
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content("新規登録")
      expect(page).to have_no_content("ログイン")
    end
  end
end