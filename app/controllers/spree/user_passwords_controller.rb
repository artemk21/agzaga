# frozen_string_literal: true

class Spree::UserPasswordsController < Devise::PasswordsController
  helper 'spree/base', 'spree/store'

  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Store

  # Overridden due to bug in Devise.
  #   respond_with resource, location: new_session_path(resource_name)
  # is generating bad url /session/new.user
  #
  # overridden to:
  #   respond_with resource, location: spree.login_path
  #
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    set_flash_message(:notice, :send_instructions) if is_navigational_format?

    if resource.errors.empty?
      respond_to do |format|
        format.html  do
          respond_with resource, location: spree.login_path
        end

        format.js
      end
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  # Devise::PasswordsController allows for blank passwords.
  # Silly Devise::PasswordsController!
  # Fixes spree/spree#2190.
  def update
    if params[:spree_user][:password].blank?
      self.resource = resource_class.new
      resource.reset_password_token = params[:spree_user][:reset_password_token]
      set_flash_message(:error, :cannot_be_blank)
      render :edit
    else
      super
    end
  end

  protected

  def translation_scope
    'devise.user_passwords'
  end

  def new_session_path(resource_name)
    spree.send("new_#{resource_name}_session_path")
  end
end

# touched on 2025-07-09T18:24:08.836157Z