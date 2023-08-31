require 'rails_helper'

RSpec.describe User, type: :model do
  it 'メールアドレスが必須であること' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'メールアドレスが一意性であること' do
    existing_user = FactoryBot.create(:user, email: 'test@example.com')
    new_user = FactoryBot.build(:user, email: 'test@example.com')
    new_user.valid?
    expect(new_user.errors[:email]).to include("has already been taken")
  end

  it 'メールアドレスに@を含む必要があること' do
    user = User.new(email: 'invalid-email')
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end

  it 'パスワードが必須であること' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'パスワードは6文字以上であること' do
    user = User.new(password: '12345')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end

  it 'パスワードとパスワード（確認）が一致すること' do
    user = User.new(
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
    expect(user).to be_valid
  end

  it 'usernameは入力必須であること' do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'kanji_first_nameは入力必須で全角（漢字、ひらがな、カタカナ）であること' do
    user = User.new(kanji_first_name: nil)
    user.valid?
    expect(user.errors[:kanji_first_name]).to include("can't be blank")
    
    user.kanji_first_name = '山田'
    user.valid?
    expect(user.errors[:kanji_first_name]).to be_empty
  end

  it 'kanji_last_nameは入力必須で全角（漢字、ひらがな、カタカナ）であること' do
    user = User.new(kanji_last_name: nil)
    user.valid?
    expect(user.errors[:kanji_last_name]).to include("can't be blank")
    
    user.kanji_last_name = '太郎'
    user.valid?
    expect(user.errors[:kanji_last_name]).to be_empty
  end

  it 'katakana_first_nameは入力必須で全角（カタカナ）であること' do
    user = User.new(katakana_first_name: nil)
    user.valid?
    expect(user.errors[:katakana_first_name]).to include("can't be blank")
    
    user.katakana_first_name = 'タロウ'
    user.valid?
    expect(user.errors[:katakana_first_name]).to be_empty
  end

  it 'katakana_last_nameは入力必須で全角（カタカナ）であること' do
    user = User.new(katakana_last_name: nil)
    user.valid?
    expect(user.errors[:katakana_last_name]).to include("can't be blank")
    
    user.katakana_last_name = 'ヤマダ'
    user.valid?
    expect(user.errors[:katakana_last_name]).to be_empty
  end

  it 'birthdayが入力必須であること' do
    user = User.new(birthday: nil)
    user.valid?
    expect(user.errors[:birthday]).to include("can't be blank")
  end
end