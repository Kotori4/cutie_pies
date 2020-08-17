require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    it "全ての項目が入力されていれば登録ができる" do
      expect(@user).to be_valid
    end
    it "ペットの名前が空白でも登録できる" do
      @user.pet_name = ""
      expect(@user).to be_valid
    end
  end

  describe 'ユーザ新規登録ができない場合' do
    it "ニックネームを未入力だと登録できない" do
     @user.nickname = ""
     @user.valid?
     expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "メールアドレスを未入力だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールアドレスを入力してください")
    end
    it "メールアドレスに@が含まれていないと登録できない" do
      @user.email = "test123.test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールアドレスは不正な値です")
    end
    it "重複したメールアドレスが存在する場合は登録ができない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールアドレスはすでに存在します")
    end
    it "パスワードを未入力だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "確認用パスワードが未入力だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "パスワードと確認用パスワードが一致しないと登録できない" do
      @user.password_confirmation = "test4567"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "パスワードが6文字未満だと登録できない" do
      @user.password = "tes12"
      @user.password_confirmation = "tes12"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "パスワードが数字だけだと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it "パスワードがアルファベットだけだと登録できない" do
      @user.password = "happycat"
      @user.password_confirmation = "happycat"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it "猫派か犬派項目が未選択だと登録できない" do
      @user.favorite_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("猫派？犬派？を入力してください")
    end
    it "ペットの有無の項目が未選択だと登録できない" do
      @user.have_pet_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ペットの有無を入力してください")
    end
  end
end