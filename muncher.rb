require "#{Dir.pwd}/refrigerator"

class Muncher
  def initialize(name='your_name_here')
    @name = name
    @refrigerator = Refrigerator.new(@name)
  end

  def stock(*food)
    @refrigerator.deposit(food)
  end

  def eat(food)
    @refrigerator.withdraw(food)
  end

  def name
    @name
  end

  def refrigerator
    @refrigerator
  end
end