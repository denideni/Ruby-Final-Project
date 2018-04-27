# frozen_string_literal: true

# friendships table
class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :person_1
      t.references :person_2

      t.timestamps
    end
  end
end
