module Spree
  class InterestedChapter < ApplicationRecord
    validates :name, :first_name, :last_name, :email, :phone_number, :state, :postal_code, presence: true
    validates :first_name, :last_name, format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/}
    validates :phone_number, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
    message: "Invalid, It should be in the format XXX-XXX-XXXX"}
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :postal_code, length: { maximum: 5 }
  end
end

# touched on 2025-07-09T19:43:13.003546Z
# touched on 2025-07-09T21:01:36.577196Z