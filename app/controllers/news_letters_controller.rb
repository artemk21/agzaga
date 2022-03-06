class NewsLettersController < ApplicationController
  respond_to :js
  before_action :add_to_mailchimp, only: :create

  def create
  end

  private

  def add_to_mailchimp


    begin
      if (params[:ffa_susbscription] == "true")
        @ffa_susbscription = params[:ffa_susbscription]
        first_name = params[:first_name]
        last_name = params[:last_name]
        email = params[:email]
        res = Mailchimp::CreateNewCustomer.new( email, first_name, last_name ).update_user_data
      else
        res = Mailchimp::CreateNewCustomer.new( params.dig( :email )).call
      end
    rescue Exception => e
      @error_message = e.detail
    end
  end
end

# touched on 2025-07-09T19:39:34.753100Z