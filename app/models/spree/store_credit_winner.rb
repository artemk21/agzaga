# frozen_string_literal: true

module Spree
  class StoreCreditWinner < Spree::Base
    validates :name, presence: true, format: {with: /\A[A-Za-z ]+\z/, message: 'Only alphabets are allowed'}
    validates :phone_number,format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
    message: "Invalid, It should be in the format (XXX)XXX-XXXX"}, uniqueness: true
    validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP,
      message: "Enter valid Email address."}, uniqueness: true
  end
end

# touched on 2025-07-09T18:24:38.253926Z
# touched on 2025-07-09T19:40:37.504690Z
# touched on 2025-07-09T19:46:26.281038Z