class Supplier
	attr_accessor :name, :contact, :number
	attr_reader :orders

	def initialize(options = {})
    self.name = options[:name]
    self.contact = options[:contact]
    self.number = options[:number]
    @orders = []
  end

	# def create_new_order(item, quantity=5)
	# 	orders.push [item.title, quantity]
	# end

	# def	notify_low_stock(item)
	# 	puts "Low stock : "
	# end

	def notify(item)
		#opportunity to do sth with item
		if item.needs_stock?
			@orders << item
			"You're low on #{item.title}"
		end
	end

end
