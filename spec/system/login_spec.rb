require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let!(:user) { create(:user) }

  describe 'ログイン機能' do
    describe 'ログイン' do
      context 'ログインが正しい場合' do
        it 'ログインできること' do
          visit login_path
          fill_in 'login-email', with: user.email
          fill_in 'login-password', with: 'password'
          click_button 'ログイン'
          expect(current_path).to eq words_path
          expect(page).to have_content 'ログインしました'
        end
      end

      context 'ログインが正しくない場合' do
        it 'ログインできないこと' do
          visit login_path
          fill_in 'login-email', with: user.email
          fill_in 'login-password', with: '1234'
          click_button 'ログイン'
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインに失敗しました'
        end
      end
    end

    describe 'ログアウト' do
      before do
        login_as_general
      end
      it 'ログアウトできること' do
        click_on('logout')
        expect(current_path).to eq root_path
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end
end
