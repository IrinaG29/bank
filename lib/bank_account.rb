require 'date'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: Date.today, amount: amount, type: "credit", balance: @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << { date: Date.today, amount: amount, type: "debit", balance: @balance }
  end

  def statement
    array = []

    array << "date || credit || debit || balance"

    @transactions.reverse.each do |transaction|
      if transaction[:type] == "credit"
        array << "#{transaction[:date].strftime('%d/%m/%Y')} || #{'%.2f' % transaction[:amount]} || || #{'%.2f' % transaction[:balance]}"
      else
        array << "#{transaction[:date].strftime('%d/%m/%Y')} || || #{'%.2f' % transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
      end
    end
    
    array.join("\n")
  end
end
