class Store

	def initialize
		@store = []
	end

    def add(item)
    	@store.push(item)
	end

	def length
		@store.length
	end

	def last
		@store.last
	end

	def all
		@store
	end

	def update(item, attrs_to_update = {})
		item_to_update = @store.find {|i| i == item}
		attrs_to_update.each do |method_name, value|
			item_to_update.send("#{method_name}=", value)
		end
		item_to_update
	end

	def delete(item)
		@store.delete(item)
	end
	
end