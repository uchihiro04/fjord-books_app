# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test 'check follow' do
    assert_not @alice.following?(@bob)
    Relationship.create(following_id: @bob.id, follower_id: @alice.id)
    assert @alice.following?(@bob)
  end

  test 'check followed' do
    assert_not @alice.followed_by?(@bob)
    Relationship.create(following_id: @alice.id, follower_id: @bob.id)
    assert @alice.followed_by?(@bob)
  end

  test 'follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test 'unfollow' do
    Relationship.create(following_id: @bob.id, follower_id: @alice.id)
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test 'name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
