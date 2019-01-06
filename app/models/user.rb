class User < ApplicationRecord
 # Include default devise modules.
  # :confirmable, :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
