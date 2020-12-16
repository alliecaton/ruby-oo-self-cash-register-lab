require "pry"

class CashRegister

    attr_accessor :total, :quantity, :last_transaction
    attr_reader :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @quantity = quantity
    end 

    def discount=(discount= 20)
        @discount = discount
    end

    def add_item(item, price, quantity=0)
        if quantity > 0 
            self.total += price * quantity
            @items << "#{item} " * quantity
            @last_transaction = price * quantity
        else
            self.total += price
            @items << item
            @last_transaction = price
        end
        @items= @items.collect { |item| item.split(" ") }.flatten
    end

    def apply_discount
        self.total = (@total - (@total * 0.2))
        if discount == 20
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end 
    end


    def void_last_transaction
        @total -= @last_transaction

    end 

end 
