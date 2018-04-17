class PaymentsController < ApplicationController
  before_action :set_status, only: [:edit, :update, :destroy]
  before_action :authenticate_user

  def new
    @payment = Payment.new
  end

  def edit
    redirect_to root_path unless @payment.user == current_user
  end

  def create
    @payment = current_user.payments.new(payment_params)

    if @payment.save
      redirect_to @payment.payer
    else
     redirect_to @payment.payer, flash: { error: "Insufficient Payment!"}
    end
  end

  def update
    if @payment.user == current_user && @payment.update(payment_params)
      redirect_to @status.user
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy if @payment.user == current_user
    redirect_back(fallback_location: @payment.user)
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:text, :payment_amount, :reason_for_payment,:requester_id, :payer_id)
  end
end