
	module Report
		def create_report
			create_html_report
		end

		def create_text
			File.open('amazing_text.txt', "w") { |file|
				write_data = " "
				write_data += "Paradise Food #{Time.now.to_s}\n"
				write_data += get_item_data_html + "\n" + get_aggregated_data_html
				file.write write_data

			}
		end

		def create_html_report
			html = File.read("stock_report.html")
			File.open("stock_report.html", "w") {|report|
				html = html.gsub(/MYDATA/, get_aggregated_data_html("html"))
				html = html.gsub(/MYARRAYDATA/, get_item_data_html("html"))
				report.write html.gsub(/(MYDATE)/, Time.now.to_s)}
		end

		def get_item_data_html(type = "text")
			output_string = ""
			@store.each do |item|
				output_string += "#{item.title}"
				if type == "html"
					output_string += "<br>"
				else
					output_string += "\n"
				end
			end
			output_string
		end

		def get_aggregated_data_html(type = "text")
			output_string = ""
			output_string += "Total: #{@store.length} item types"
			if type == "html"
				output_string += "<br>"
			else
				output_string += "\n"
			end
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


# class Report
































