require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :form_type
  validates :name, presence: true, length: { maximum: 50 }, if: :user_name_field?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, if: :email_field?
  validates :password, presence: true, length: { minimum: 6 }, if: :password_field?
  after_save :clear_password

  def password=(new_password)
    self.password_digest = Password.create(new_password)
    @password = new_password
  end

  def password
    @password
  end

  def clear_password
    password = nil
  end

  # conditional validations
  def user_name_field?
    form_type == "name"
  end

  def email_field?
    form_type == "email"
  end

  def password_field?
    form_type == "password"
  end

end