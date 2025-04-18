class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :name, :email, presence: true, allow_blank: false
  validates :password, presence: true, confirmation: true, on: :create
  validates :password, confirmation: true, allow_blank: false, on: :update
end
