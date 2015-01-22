class Item
	attr_accessor :quantity, :title,  :price, :best_before, :purchase_date, 
	:supplier, :supplier_contact, :supplier_number
	attr_reader :id

	@@next_id = 1

 
	def initialize(attributes = {})
		@observers = []
		attributes.each do |attribute, value|
			self.send "#{attribute}=", value
		end

		@id = @@next_id
		@@next_id += 1

	end

	# def handle_low_stock
	# 	supplier.notify_low_stock(self)
	# 	supplier.create_new_order(self)
	# end

#Compare self with other_item and return true / false if they're equivalent
  
  def ==(other_item)
  	@id == other_item.id
  end

  def add_observer(o)
  	@observers << o
  end
 # I may repeat myself at this point but this gives me the opportunity 
 #to add more elements in the quantity method
  def quantity=(q)
  	@quantity = q
  	notify_observers unless @observers.empty?
  end

  def needs_stock?
  	quantity < 3
  end

  private 
  def notify_observers
  	@observers.each do |observer|
  		observer.notify(self) # self represents an item object
  	end
  end
end




