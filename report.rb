class Report
	attr_accessor :data
	attr_accessor :mode

	def initialize(data, mode = :text)
		self.data = data
		@mode = mode
	end

	def to_s
		"#{make_header}#{make_body}#{make_footer}"
	end

	def make_header
		if mode == :text
			"Stock Report"
		elsif mode == :html
			<h1> Stock Report</h1>
		end
	end

	def make_body
		if mode == :text
			@data.each do |item|
				output+=item
			end
		elsif mode == :html
			output = "<table><tr><th>Title</th> <th>Quantity</th><th>Price</th><th>Best Before</th></tr>"
			@data.each do |item|
				output+="<tr><td>#{item.title}</td><td>#{item.quantity}</td><td>#{item.price}</td><td>#{item.best_before}</td></tr>"
			end
			output += "</table>"
		end

		output
	end


	def make_footer
		output = " "
		if mode == :text
			output
		end
	end
end