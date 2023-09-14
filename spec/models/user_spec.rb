require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '正常系' do
    it '正しい情報が入力されていればバリデーションが通ること' do
      expect(@user).to be_valid
    end

    context '異常系' do
      it 'メールアドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'メールアドレスが一意性であること' do
        FactoryBot.create(:user, email: 'test@example.com')
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it 'メールアドレスに@を含む必要があること' do
        @user.email = 'invalid-email'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'パスワードが必須であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードは6文字以上であること' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください", "パスワードは不正な値です")
      end

      it 'パスワードとパスワード（確認）が一致すること' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end

      it 'usernameは入力必須であること' do
        @user.username = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'kanji_first_nameは入力必須であること' do
        @user.kanji_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓)を入力してください")
      end

      it 'kanji_first_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
        @user.kanji_first_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓)は不正な値です")
      end

      it 'kanji_first_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
        @user.kanji_first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓)は不正な値です")
      end

      it 'kanji_last_nameは入力必須でであること' do
        @user.kanji_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名)を入力してください")
      end

      it 'kanji_last_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
        @user.kanji_last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名)は不正な値です")
      end

      it 'kanji_last_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
        @user.kanji_last_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名)は不正な値です")
      end

      it 'katakana_first_nameは入力必須であること' do
        @user.katakana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(姓)を入力してください")
      end

      it 'katakana_first_nameはカタカナ以外では保存できないこと' do
        @user.katakana_first_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(姓)は不正な値です")
      end

      it 'katakana_first_nameはカタカナ以外では保存できないこと' do
        @user.katakana_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(姓)は不正な値です")
      end

      it 'katakana_first_nameはカタカナ以外では保存できないこと' do
        @user.katakana_first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(姓)は不正な値です")
      end

      it 'katakana_last_nameは入力必須であること' do
        @user.katakana_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)を入力してください")
      end

      it 'katakana_last_nameはカタカナ以外では保存できないこと' do
        @user.katakana_last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)は不正な値です")
      end

      it 'katakana_last_nameはカタカナ以外では保存できないこと' do
        @user.katakana_last_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)は不正な値です")
      end

      it 'katakana_last_nameはカタカナ以外では保存できないこと' do
        @user.katakana_last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名)は不正な値です")
      end

      it 'birthdayが入力必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it '英字のみのパスワードでは登録できないこと' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it '数字のみのパスワードでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it '全角文字のみのパスワードでは登録できないこと' do
        @user.password = 'パスワード'
        @user.password_confirmation = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
    end
  end
end