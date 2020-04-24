class CashRegister
  attr_accessor :total, :discount, :last_item
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    if quantity > 1
      i = 0
      while i < quantity
          @items << title
          i+=1
        end
    else
        @items << title
    end
    @total += (price * quantity)
    @last_item =  price * quantity
  end
  
  def apply_discount
    if self.discount > 0
        self.total = self.total - (self.total * (self.discount / 100.0))
        "After the discount, the total comes to $#{self.total.to_i}."
    else
        "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_item
  end
  
end
