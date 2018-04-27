# frozen_string_literal: true

# user.rb
class User < ApplicationRecord
  include BCrypt
  has_many :payments, dependent: :destroy, foreign_key: :payer_id
  has_many :friendships, foreign_key: :person_1_id

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    first_name + ' ' + last_name
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
  end

  def selected_users
    User.where.not(id: id)
  end
end
