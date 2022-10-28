require "pry"

class CashRegister
    attr_accessor :total, :discount, :title, :price
    


    def initialize(discount=0)
        @discount=discount
        @total=0 
        @items=[]
        
    end
    def add_item(title, price, quantity=1)
        @title=title
        @price=price
        @items << {title: title, price: price, quantity: quantity}
        @total += price * quantity
        
    end
    def apply_discount
        if (@discount>0)
          @total=@total*(100-self.discount)/100
         "After the discount, the total comes to $#{@total}."
                
            else
                "There is no discount to apply."
            end
        end


        def items
            name_array = Array.new

        @items.each do |item|
            item[:quantity].times {|| name_array << item[:title]}
        end

        name_array
        end
       
        def void_last_transaction
            @items.delete(-1)
            @total -= (@items[-1][:price]).to_f * (@items[-1][:quantity]).to_f
            @total
        end

end



total=CashRegister.new






binding.pry