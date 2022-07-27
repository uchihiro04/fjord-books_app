# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:test_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '吾輩は猫である'
    fill_in 'メモ', with: '小説です'
    fill_in '著者', with: '夏目漱石'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text '吾輩は猫である'
    assert_text '小説です'
    assert_text '夏目漱石'
  end

  test 'updating a book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: 'Rubyテスト入門 第2版'
    fill_in 'メモ', with: 'テスト本の第2版です。'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'Rubyテスト入門 第2版'
    assert_text 'テスト本の第2版です。'
  end

  test 'destroying a book' do
    visit books_url
    assert_text 'Rubyテスト入門'
    assert_text 'テスト本です'

    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
    assert_no_text 'Rubyテスト入門'
    assert_no_text 'テスト本です'
  end
end
