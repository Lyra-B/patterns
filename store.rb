
	module Report
		def create_report
			add_current_time_to_report
		end

		def add_current_time_to_report
			html = File.read("stock_report.html")
			File.open("stock_report.html", "w") {|report|
				html = html.gsub(/MYDATA/, get_aggregated_data_html)
				html = html.gsub(/MYARRAYDATA/, get_item_data_html)
				report.write html.gsub(/(MYDATE)/, Time.now.to_s)}
		end

		def get_item_data_html
			output_string = ""
			@store.each do |item|
				output_string += "#{item.title}<br>"
			end
			output_string
		end

		def get_aggregated_data_html
			output_string = ""
			output_string += "Total: #{@store.length} item types<br>"
			output_string += "There are #{count_number_of_items} items"
		end

		def count_number_of_items
			total = 0
			@store.each do |item|
				total += item.quantity
			end
			total
		end


  end

 


class Store
	include Report
 
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

  def take(item, quantity)
    update(item, :quantity => item.quantity - quantity)
  end
end





