class CashRegister
  attr_accessor :total
  attr_reader :discount
  attr_reader :items_list
  attr_accessor :last_total
  
  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items_list = []
  end
  
  # def discount
  #   @discount
  # end
  
  # def total=(new_total)
  #   @total = new_total
  # end
  
  # def total
  #   @total
  # end
  
  def add_item(title, price, quantity=1)
    @total += price * quantity
    # counter = 0
    # while counter < quantity
    #   @items_list << title
    #   counter += 1
    # end
    
    quantity.times do
      @items_list << title
    end
  
    @last_total = price * quantity
  end
  
  def apply_discount
    if discount
      @total = @total - @total * (@discount/100.0)
      @total = @total.round 
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items_list    
  end
  
  def void_last_transaction
    @total = @total - @last_total
  end
  
end
