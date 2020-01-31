require 'rails_helper'

RSpec.describe 'PasswordReset', type: :system do
  let(:user) { create(:user) }

  it 'パスワードが変更できる' do
    visit new_password_reset_path
    fill_in 'password-reset-email', with: user.email
    click_button '送信'
    expect(page).to have_content 'パスワードリセット手順を送信しました'
    visit edit_password_reset_path(user.reload.reset_password_token)
    fill_in 'password-reset', with: 'passwordreset'
    fill_in 'password-reset-confirmation', with: 'passwordreset'
    click_button '更新する'
    expect(current_path).to eq login_path
  end
end
