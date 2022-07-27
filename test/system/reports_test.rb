# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'はじめまして'
    fill_in '内容', with: '初めて日報を書きました。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'はじめまして'
    assert_text '初めて日報を書きました。'
  end

  test 'updating a report' do
    visit reports_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: 'こんにちは'
    fill_in '内容', with: '日報を書くのは初めてです。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'こんにちは'
    assert_text '日報を書くのは初めてです。'
  end

  test 'destroying a report' do
    visit reports_url
    assert_text 'テストです'
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text 'テストです'
  end
end
