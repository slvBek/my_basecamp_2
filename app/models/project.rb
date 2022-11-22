class Project < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :tasks, dependent: :destroy
  # after_destroy {notify admin of bad behavior}
  has_many :comments, dependent: :destroy
end
