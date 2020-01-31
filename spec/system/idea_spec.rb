require 'rails_helper'

RSpec.describe 'Idea', type: :system do
  let!(:user) { create(:user) }
  let!(:idea) { create(:idea) }

  describe 'アイデアのCRUD' do
    describe 'アイデア一覧' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされること' do
          visit ideas_path
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインして下さい'
        end
      end

      context 'ログインしている場合' do
        it 'ヘッダーのリンクからアイデア一覧へ遷移できること' do
          login_as_general
          click_on('idea-all')
          expect(current_path).to eq ideas_path
        end

        context 'アイデアが一件もない場合' do
          it '何もない旨のメッセージが表示されること' do
            login_as_general
            visit ideas_path
            expect(page).to have_content 'アイデアが登録されていません'
          end
        end

        context 'アイデアがある場合' do
          it 'アイデアの一覧が表示されること' do
            create_my_idea(user)
            visit ideas_path
            expect(page).to have_content user.ideas.first.title
            expect(page).to have_content I18n.l(user.ideas.first.created_at, format: :short)
          end
        end
      end
    end

    describe 'アイデア登録' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされること' do
          visit new_idea_path
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインして下さい'
        end
      end

      context 'ログインしている場合' do
        before do
          login_as_general
          click_on('new-idea')
        end

        it 'アイデアが登録できること' do
          fill_in 'idea_title', with: 'テストタイトル'
          fill_in 'idea_category', with: 'テストカテゴリー'
          fill_in 'idea_body', with: 'テスト本文'
          click_button '登録'
          expect(current_path).to eq ideas_path
          expect(page).to have_content 'アイデアの登録が完了しました'
          expect(page).to have_content 'テストタイトル'
        end

        it 'アイデアの登録に失敗すること' do
          click_button '登録'
          expect(page).to have_content 'アイデアを登録できませんでした'
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end

    describe 'アイデアの詳細' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされること' do
          visit idea_path(idea.id)
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインして下さい'
        end
      end

      context 'ログインしている場合' do
        before do
          create_my_idea(user)
        end
        it 'アイデアの詳細が表示されること' do
          visit ideas_path
          find("#idea-#{user.ideas.first.id}").click
          expect(page).to have_content user.ideas.first.title
          expect(page).to have_content user.ideas.first.user.name
          expect(page).to have_content user.ideas.first.category
          expect(page).to have_content user.ideas.first.body
          expect(page).to have_content I18n.l(user.ideas.first.created_at, format: :short)
        end
      end
    end

    describe 'アイデアの更新' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされること' do
          visit edit_idea_path(idea.id)
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインして下さい'
        end
      end

      context 'ログインしている場合' do
        context 'アイデア更新' do
          before do
            create_my_idea(user)
            visit ideas_path
            find("#edit-idea-#{user.ideas.first.id}").click
          end
          it 'アイデアが更新できること' do
            fill_in 'idea_title', with: '編集タイトル'
            fill_in 'idea_category', with: '編集カテゴリー'
            fill_in 'idea_body', with: '編集本文'
            click_button '登録'
            expect(current_path).to eq idea_path(user.ideas.first.id)
            expect(page).to have_content 'アイデアを更新しました'
            expect(page).to have_content '編集タイトル'
            expect(page).to have_content '編集カテゴリー'
            expect(page).to have_content '編集本文'
          end

          it 'アイデアの登録に失敗すること' do
            fill_in 'idea_title', with: ''
            click_button '登録'
            expect(page).to have_content 'アイデアを更新できませんでした'
          end
        end
      end
    end

    describe 'アイデアの削除' do
      before do
        create_my_idea(user)
      end
      context 'アイデアの削除' do
        it 'アイデアが削除できること', js: true do
          visit ideas_path
          page.accept_confirm { find("#delete-idea-#{user.ideas.first.id}").click }
          expect(current_path).to eq ideas_path
          expect(page).to have_content 'アイデアを削除しました'
        end
      end
    end
  end
end
