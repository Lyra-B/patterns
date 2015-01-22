class Item
	attr_accessor :quantity, :title,  :price, :best_before, :purchase_date, 
	:supplier, :supplier_contact, :supplier_number
 
	def initialize(attributes = {})
		attributes.each do |attribute, value|
			self.send "#{attribute}=", value
		end
	end


	
end


