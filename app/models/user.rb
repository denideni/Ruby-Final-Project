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
    self.password_hash = @password
  end

  def selected_users
    return User.where.not(id: self.id)
  end

end
