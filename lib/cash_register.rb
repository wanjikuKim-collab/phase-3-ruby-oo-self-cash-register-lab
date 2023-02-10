require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total , :title, :price, :items ,:last_transaction

    def initialize(discount=0)
        @discount = discount   
        @total = 0
        @items = []
    end

    def add_item(title , price, quantity=1)
        @price = price
        @total += price*quantity
        @last_transaction = price*quantity
        quantity.times { self.items << title}
    end

    def apply_discount
        if @discount> 0
            item_discount = @price*@discount /100
            @total -= item_discount
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction 
        @items.size == 0? @total = 0 : @total-= @last_transaction
    end
end

cash_register = CashRegister.new(25)
cash_register.add_item("Justin's Peanut Butter Cups", 2.50, 2)

cash_register_with_discount = CashRegister.new(20)
cash_register_with_discount.add_item("macbook air", 1000)


new_register = CashRegister.new
new_register.add_item("tomato", 1.76, 3)
new_register.add_item("beans", 2.36, 2)
new_register.add_item("eggs", 1.99, 2)
new_register.add_item("tomato", 1.76, 2)





