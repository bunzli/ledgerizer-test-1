# Example:
#
# Ledgerizer.setup do |conf|
#   conf.tenant(:portfolio) do
#     conf.asset :bank
#     conf.liability :funds_to_invest
#     conf.liability :to_invest_in_fund
#
#     conf.entry :user_deposit, document: :user_deposit do
#       conf.debit account: :bank, accountable: :bank
#       conf.credit account: :funds_to_invest, accountable: :user
#     end
#
#     conf.entry :user_deposit_distribution, document: :user_deposit do
#       conf.debit account: :funds_to_invest, accountable: :user
#       conf.credit account: :to_invest_in_fund, accountable: :user
#     end
#   end
# end

Ledgerizer.setup do |conf|
  conf.tenant(:casino, currency: :ban) do
    conf.asset :bananas_in_custody
    conf.income :withdrawal_fees
    conf.liability :bananas_availables

    conf.entry :user_deposit_bananas, document: :deposit do
      conf.debit account: :bananas_in_custody
      conf.credit account: :bananas_availables, accountable: :user
    end

    conf.entry :user_withdrawal_bananas, document: :withdrawal do
      conf.credit account: :bananas_in_custody
      conf.credit account: :withdrawal_fees
      conf.debit account: :bananas_availables, accountable: :user
    end
  end
end
