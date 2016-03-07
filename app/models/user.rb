require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  after_save :clear_password

  def password=(new_password)
    @new_password = new_password
    enc_password = Password.create(@new_password)
    self.password_digest = enc_password
    @new_password
  end

  def password
    @new_password
  end

  def clear_password
    password = nil
  end

  # conditional validations
  def user_name_field
    form_type == "name"
  end

  def email_field
    form_type == "email"
  end

  def password_field
    form_type == "password"
  end

end