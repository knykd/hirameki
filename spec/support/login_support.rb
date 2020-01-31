module LoginSupport
  def login_as_general
    general_user = create(:user)
    visit login_path
    fill_in 'login-email', with: general_user.email
    fill_in 'login-password', with: 'password'
    click_button 'ログイン'
  end
end
