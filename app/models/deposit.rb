class Deposit < ApplicationRecord
  include LedgerizerDocument

  belongs_to :user
end
