require "bank_account"

describe BankAccount do
  describe "deposit" do
    it "adds amount to the bank account" do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
  end

  describe "withdraw" do
    it "deducts amount from bank account" do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.balance).to eq(50)
    end
  end

  describe "transactions" do
    it "shows date, amount, type, balance" do
      subject.deposit(100)
      subject.withdraw(10)
      expect(subject.transactions[0]).to eq({ date: Date.today, amount: 100, type: "credit", balance: 100 })
      expect(subject.transactions[1]).to eq({ date: Date.today, amount: 10, type: "debit", balance: 90 })
    end
  end

  describe "statement" do
    it "prints date, amount, type, balance" do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.statement).to eq("date || credit || debit || balance\n08/08/2021 || || 500.00 || 2500.00\n08/08/2021 || 2000.00 || || 3000.00\n08/08/2021 || 1000.00 || || 1000.00")
    end
  end
end
