# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  with_options presence: true do
    validates :content
    validates :commentable_type
    validates :commentable_id
  end
end
