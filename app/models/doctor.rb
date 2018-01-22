class Doctor < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :users, through: :appointments
end
