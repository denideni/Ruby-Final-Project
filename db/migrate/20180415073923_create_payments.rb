# frozen_string_literal: true

# payments table
class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :payment_amount
      t.references :requester
      t.references :payer
      t.datetime :time_of_payment
      t.text :reason_for_payment

      t.timestamps
    end
  end
end
