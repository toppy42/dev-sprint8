class Refrigerator
  def initialize(owner = 'nobody')
    @owner = owner
    @contents = []
  end

  def deposit(*food)
    @contents = (@contents << food).flatten
    puts "#{@owner} just added #{food_string(food)} to the refrigerator."
  end

  def food_string(food)
    food.is_a?(Array) ? food.join(' ').to_s : food.to_s
  end

  def withdraw(food)
    if @contents.include?(food)
      @contents.delete(food)
      puts "#{@owner} just ate #{food} from the refrigerator."
    else
      puts "There is no #{food} in the refrigerator."
    end
  end

  def inspect
    "This is #{@owner}'s refrigerator, and contains #{@contents.length} items."
  end

  def contents
    @contents
  end
end