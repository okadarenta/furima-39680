require 'rails_helper'

RSpec.describe User, type: :model do
  context '正常系' do
    before do
      @user = User.new(
        email: 'test@example.com',
        username: 'testuser',
        kanji_first_name: '太郎',
        kanji_last_name: '山田',
        katakana_first_name: 'タロウ',
        katakana_last_name: 'ヤマダ',
        birthday: Date.new(1990, 1, 1),
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    it '正しい情報が入力されていればバリデーションが通ること' do
      expect(@user).to be_valid
    end

    context '異常系' do
      before do
        @user = User.new(
          email: 'test@example.com',
          username: 'testuser',
          kanji_first_name: '太郎',
          kanji_last_name: '山田',
          katakana_first_name: 'タロウ',
          katakana_last_name: 'ヤマダ',
          birthday: Date.new(1990, 1, 1),
          password: 'password123',
          password_confirmation: 'password123'
        )
      end
    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end
  
    it 'メールアドレスが一意性であること' do
      FactoryBot.create(:user, email: 'test@example.com')
      @user.valid?
      expect(@user.errors[:email]).to include("has already been taken")
    end
  
    it 'メールアドレスに@を含む必要があること' do
      @user.email = 'invalid-email'
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end
  
    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end
  
    it 'パスワードは6文字以上であること' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  
    it 'パスワードとパスワード（確認）が一致すること' do
      expect(@user).to be_valid
    end
  
    it 'usernameは入力必須であること' do
      @user.username = nil
      @user.valid?
      expect(@user.errors[:username]).to include("can't be blank")
    end
  
    it 'kanji_first_nameは入力必須であること' do
      @user.kanji_first_name = nil
      @user.valid?
      expect(@user.errors[:kanji_first_name]).to include("can't be blank")
    end
  
    it 'kanji_first_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
      @user.kanji_first_name = 'Taro'
      @user.valid?
      expect(@user.errors[:kanji_first_name]).to include('is invalid')
    end
   
    it 'kanji_first_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
      @user.kanji_first_name = '123'
      @user.valid?
      expect(@user.errors[:kanji_first_name]).to include('is invalid')
    end

      it 'kanji_last_nameは入力必須でであること' do
        @user.kanji_last_name = nil
        @user.valid?
        expect(@user.errors[:kanji_last_name]).to include("can't be blank")
      end
   
      it 'kanji_last_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
      @user.kanji_last_name = '123'
      @user.valid?
      expect(@user.errors[:kanji_last_name]).to include('is invalid')
      end
    
      it 'kanji_last_nameは全角漢字・平仮名・カタカナ以外では保存できないこと' do
        @user.kanji_last_name = 'Taro'
        @user.valid?
        expect(@user.errors[:kanji_last_name]).to include('is invalid')
      end
    it 'katakana_first_nameは入力必須であること' do
      @user.katakana_first_name = nil
      @user.valid?
      expect(@user.errors[:katakana_first_name]).to include("can't be blank")
    end
    it 'katakana_first_nameはカタカナ以外では保存できないこと' do
      @user.katakana_first_name = 'Taro'
      @user.valid?
      expect(@user.errors[:katakana_first_name]).to include('is invalid')
    end

    it 'katakana_first_nameはカタカナ以外では保存できないこと' do
      @user.katakana_first_name = '太郎'
      @user.valid?
      expect(@user.errors[:katakana_first_name]).to include('is invalid')
    end
  
    it 'katakana_first_nameはカタカナ以外では保存できないこと' do
      @user.katakana_first_name = '123'
      @user.valid?
      expect(@user.errors[:katakana_first_name]).to include('is invalid')
    end
    
    it 'katakana_last_nameは入力必須であること' do
      @user.katakana_last_name = nil
      @user.valid?
      expect(@user.errors[:katakana_last_name]).to include("can't be blank")
    end

    it 'katakana_last_nameはカタカナ以外では保存できないこと' do
      @user.katakana_last_name = '123'
      @user.valid?
      expect(@user.errors[:katakana_last_name]).to include('is invalid')
    end

    it 'katakana_last_nameはカタカナ以外では保存できないこと' do
      @user.katakana_last_name = '太郎'
      @user.valid?
      expect(@user.errors[:katakana_last_name]).to include('is invalid')
    end

    it 'katakana_last_nameはカタカナ以外では保存できないこと' do
      @user.katakana_last_name = 'taro'
      @user.valid?
      expect(@user.errors[:katakana_last_name]).to include('is invalid')
    end
  
    it 'birthdayが入力必須であること' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    it '英字のみのパスワードでは登録できないこと' do
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
  
    it '数字のみのパスワードでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
  
    it '全角文字のみのパスワードでは登録できないこと' do
      @user.password = 'パスワード'
      @user.password_confirmation = 'パスワード'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
  end
end
end