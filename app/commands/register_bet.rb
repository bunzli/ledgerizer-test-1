class RegisterBet < PowerTypes::Command.new(:bet)
  include Ledgerizer::Execution::Dsl

  def perform
    execute_bet_bananas_entry(tenant: casino, document: @bet, datetime: @bet.created_at) do
      User.all.each do |user|
        debit(account: :bananas_availables, accountable: user, amount: bet_bananas)
      end

      credit(account: :bananas_in_table_bet, amount: jackpot_bananas)
    end

    execute_recieve_jackpot_entry(tenant: casino, document: @bet, datetime: @bet.created_at) do
      debit(account: :bananas_in_table_bet, amount: jackpot_bananas)
      credit(account: :bananas_availables, accountable: @bet.winner, amount: jackpot_bananas)
    end
  end

  private

  def jackpot_bananas
    Money.from_amount(User.count * 5, 'BAN')
  end

  def bet_bananas
    Money.from_amount(5, 'BAN')
  end

  def casino
    Casino.first
  end
end
