class Item
	attr_accessor :quantity, :title,  :price, :best_before, :purchase_date, 
	:supplier, :supplier_contact, :supplier_number
 
	def initialize(attributes = {})
		attributes.each do |attribute, value|
			self.send "#{attribute}=", value
		end
	end

#Compare self with other_item and return true / false if they're equivalent
	def eql?(other_item)
		self.title == other_item.title
	end
  
  def ==(other_item)
  	self.title == other_item.title
  end
end




