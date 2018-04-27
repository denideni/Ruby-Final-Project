# frozen_string_literal: true

# friendship.rb
class Friendship < ApplicationRecord
  belongs_to :person_1, class: 'User'
  belongs_to :person_2, class: 'User'
end
