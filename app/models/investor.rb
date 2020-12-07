class Investor < ApplicationRecord
    has_many :portfolios
    has_many :stocks, through: :portfolios

    validates_uniqueness_of :username, message: "is already taken"

    has_secure_password

end
