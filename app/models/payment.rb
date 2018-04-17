class Payment < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :payer, class_name: 'User'
  validates :payment_amount, numericality: { greater_than: 0 } 
  validates :reason_for_payment, presence: true
end
