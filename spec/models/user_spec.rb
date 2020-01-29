require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前、メールアドレスがあり、パスワードは3文字以上であれば有効であること' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'メールアドレスはユニークであること' do
    user1 = create(:user)
    dummy_user = build(:user)
    dummy_user.email = user1.email
    dummy_user.valid?
    expect(dummy_user.errors[:email]).to include('はすでに存在します')
  end

  it 'メールアドレスと名前は必須であること' do
    user = build(:user)
    user.email = nil
    user.name = nil
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
    expect(user.errors[:name]).to include("を入力してください")
  end
end
