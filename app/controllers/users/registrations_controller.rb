# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user
end
