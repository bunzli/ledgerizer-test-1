class RegisterDeposit < PowerTypes::Command.new(:deposit)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_user_deposit_bananas_entry(tenant: casino, document: @deposit, datetime: @deposit.created_at) do
      debit(account: :bananas_in_custody, amount: bananas)
      credit(account: :bananas_availables, accountable: @deposit.user, amount: bananas)
    end
  end

  private

  def bananas
    Money.from_amount(@deposit.bananas, 'BAN')
  end

  def casino
    Casino.first
  end
end
