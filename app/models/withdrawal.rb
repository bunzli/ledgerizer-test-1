class Withdrawal < ApplicationRecord
  include LedgerizerDocument

  belongs_to :user
end
