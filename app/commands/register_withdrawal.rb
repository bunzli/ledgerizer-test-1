class RegisterWithdrawal < PowerTypes::Command.new(:withdrawal)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_user_withdrawal_bananas_entry(tenant: casino, document: @withdrawal, datetime: @withdrawal.created_at) do
      credit(account: :bananas_in_custody, amount: total_bananas - fee_bananas)
      credit(account: :withdrawal_fees, amount: fee_bananas)
      debit(account: :bananas_availables, accountable: @withdrawal.user, amount: total_bananas)
    end
  end

  private

  def fee_bananas
    Money.new(1, 'BAN')
  end

  def total_bananas
    Money.new(@withdrawal.bananas, 'BAN')
  end

  def casino
    Casino.first
  end
end
