class Bank
	# withdraw checks that the amount is valid and
	# that this transaction won't increase balance past the limit
	# then increases the balance and returns the state of the transaction
	def withdraw(card, amount)
		if card.class == CreditCard && amount.is_a?(Numeric) && amount >= 0
			rounded = (amount * 100).round / 100
			if card.balance + rounded <= card.limit
				card.increase_balance(amount)
				true
			else
				false
			end
		else
			false
		end
	end
end

class CreditCard
	def initialize(bank, number, limit)
		@bank = bank
		@number = number
		@limit = limit
		@balance = 0
	end

	def increase_balance(amount)
		@balance += amount
	end

	def bank
		@bank
	end

	def limit
		@limit
	end

	def balance
		@balance
	end
end

class BankCustomer
	def initialize(bank, first, last)
		@bank = bank
		@card = nil
	end

	def bank
		@bank
	end

	def add_card(number, limit)
		@card = CreditCard.new(self.bank, number, limit)
	end

	def card
		@card
	end
	
end

# Defines a store
class Store
	#stores only have a name
	def initialize(name)
		@name = name
	end

	# A transaction requires a card and an amount.
	# The bank is looked up via the card, then a withdraw function is called
	def transact(card, amount)
		if card.bank.withdraw(card, amount)
			puts "Transaction Approved"
		else
			puts "Transaction Denied"
		end
	end
end

bobs = Store.new("Bobs")
banks = Bank.new()
tim = BankCustomer.new(banks, "Tim", "New")
tim.add_card(1, 10)
bobs.transact(tim.card, 20)
tim.add_card(2, 40)
bobs.transact(tim.card, 40)
bobs.transact(tim.card, 1)
