class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_rich_text :body
end
