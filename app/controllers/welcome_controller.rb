# frozen_string_literal: true

# welcome controller
class WelcomeController < ApplicationController
  def index
    @payments = Payment.all
  end
end
