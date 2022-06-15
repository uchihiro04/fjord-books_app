# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy 
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'following_id', dependent: :destroy
  has_many :followings, through: :active_follows
  has_many :followers, through: :passive_follows

  def follow(user_id)
    active_follows.create(following_id: user_id)
  end
  
  def unfollow(user_id)
    active_follows.find_by(following_id: user_id).destroy
  end
  
  def following?(other_user)
    followings.include?(other_user)
  end
end
