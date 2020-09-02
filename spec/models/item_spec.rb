require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.item_image = fixture_file_upload('public/image/test_image.png')
  end

  describe 'アイテム投稿' do
    it "全ての項目が入力されていれば登録ができる" do
      expect(@item).to be_valid
    end
    it "AmazonURLが空白でも投稿できる" do
      @item.item_link = ""
      expect(@item).to be_valid
    end
    it "アイテム画像が空白でも投稿できる" do
      @item.item_image = ""
      expect(@item).to be_valid
    end
  end

  describe '商品登録' do
    it "タイトルが空だと保存ができない" do
      @item.item_title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item titleを入力してください")
    end
    it "おすすめの詳細が空だと保存ができない" do
      @item.item_text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item textを入力してください")
    end

  end

end