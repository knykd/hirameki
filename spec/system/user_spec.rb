require 'rails_helper'

RSpec.describe 'CreateUser', type: :system do

  context '入力情報正常系' do
    it 'ユーザーが新規作成できること' do
      visit new_user_path
      fill_in 'name', with: 'ユーザー'
      fill_in 'email', with: 'user@example.com'
      fill_in 'password', with: 'user123'
      fill_in 'password-confirmation', with: 'user123'
      click_button '登録'
      expect(current_path).to eq login_path
    end
  end

  context '入力情報異常系' do
    it 'ユーザーが新規作成できない' do
      visit new_user_path
      fill_in 'name', with: 'ユーザー'
      click_button '登録'
      expect(current_path).to eq '/users'
    end
  end
end
