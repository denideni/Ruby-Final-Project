class WelcomeController < ApplicationController

  def index
    @payments = Payment.all
  end
end
