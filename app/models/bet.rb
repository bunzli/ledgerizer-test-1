class Bet < ApplicationRecord
  belongs_to :winner, class_name: "User"
  belongs_to :casino
end
