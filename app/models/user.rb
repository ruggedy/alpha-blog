class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :username, presence: true,
             length: {minimum:3, maximum:20},
             uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
             uniqueness: {case_sensitive: false},
             length: {maximum: 105},
             format: {with: VALID_EMAIL_REGEX}
  VALID_PASSWORD_REGEX = /(?=^.{6,255}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*/i
  validates :password, presence: true,
            length: {minimum: 6, maximum: 72},
            format: {with: VALID_PASSWORD_REGEX}

end
