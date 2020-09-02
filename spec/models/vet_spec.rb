require 'rails_helper'
describe Vet do
  before do
    @user = FactoryBot.create(:user)
    @vet = FactoryBot.build(:vet)
    @vet.vet_image = fixture_file_upload('public/image/test_image.png')
  end

  describe '動物病院または病気に関する投稿' do
    it "全ての項目が入力されていれば登録ができる" do
      expect(@vet).to be_valid
    end
    it "画像が空白でも登録ができる" do
      @vet.vet_image = ""
      expect(@vet).to be_valid
    end
  end

  describe '動物病院または病気に関する投稿' do
    it "タイトルが空だと保存ができない" do
      @vet.vet_title = nil
      @vet.valid?
      expect(@vet.errors.full_messages).to include("Vet titleを入力してください")
    end
    it "質問/おすすめ情報が空だと保存ができない" do
      @vet.vet_text = nil
      @vet.valid?
      expect(@vet.errors.full_messages).to include("Vet textを入力してください")
    end
  end
end