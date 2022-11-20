class Project < ApplicationRecord
  after_create_commit {broadcast_prepend_to "projects"}
  after_update_commit {broadcast_replace_to "projects"}
  after_destroy_commit {broadcast_remove_to "projects"}
  belongs_to :user
  has_many_attached :images
  has_many :tasks, dependent: :destroy
  # after_destroy {notify admin of bad behavior}
  has_many :comments, dependent: :destroy
end
