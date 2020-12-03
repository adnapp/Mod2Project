class Investor < ApplicationRecord
    has_many :portfolios
    has_many :stocks, through: :portfolios

    has_secure_password
end
