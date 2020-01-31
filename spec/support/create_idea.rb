module CreateMyIdea
  def create_my_idea(current_user)
    visit login_path
    fill_in 'login-email', with: current_user.email
    fill_in 'login-password', with: 'password'
    click_button 'ログイン'

    click_on('new-idea')
    fill_in 'idea_title', with: 'テストタイトル'
    fill_in 'idea_category', with: 'テストカテゴリー'
    fill_in 'idea_body', with: 'テスト本文'
    click_button '登録'
  end
end
