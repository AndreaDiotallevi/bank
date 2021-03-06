require "statement"

describe Statement do
  let(:transaction) { double(:transaction, format: "10/01/2012 || 1000.00 || || 1000.00") }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:statement) { Statement.new(transaction_class) }

  describe "#add_transaction" do
    it "should return all transactions" do
      expect(statement.add_transaction(1000, 0, 1000)).to eq [transaction]
    end
  end

  describe "#format_transactions" do
    it "should return a formatted table with transactions date, credit, debit and balance" do
      statement.add_transaction(1000, 0, 1000)
      expect(statement.format_transactions).to eq "#{Statement::TITLE}\n10/01/2012 || 1000.00 || || 1000.00"
    end
  end
end
