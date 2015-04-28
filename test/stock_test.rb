require 'minitest/autorun'
require './item'
require './store'
require 'date'
require './supplier'
require './report'

class StockTest < Minitest::Test
	describe 'The stock System' do
		before do
			supplier = Supplier.new(:name => "Sainsburys Ltd.", :contact => "Mr. Smith",
      :number => "12345 6789012")

			@item = Item.new(:quantity => 5, :title => "Loaf of Bread",
				:price => 1.0,  :best_before => Date.new(2015, 2, 1),
				:purchase_date => Date.new(2015, 1, 22),
				:supplier => supplier)

			@item.add_observer (supplier)
			@store = Store.new
			@store.add @item
		end

		it "should consider two items as the same, if they share the same title" do
			item = Item.new
			item.instance_variable_set(:@id, @item.id)
			@item.must_equal item
		end

    describe "Create an Item" do
    	it "should now be stored in the store" do
    		@store.length.must_equal 1
    		@store.last.must_equal @item
    	end
    end

    describe "Read Items" do
    	it "should find an array of all items" do
    		@store.all.must_equal [@item]
      end
    end

    describe "Updating Item" do
    	before do
    		@updated = @store.update(@item, {:quantity => 7})
    	end

    	it "should be able to update an item" do
    		@updated.quantity.must_equal 7
    	end
    end

    describe "Deleting an Item" do
    	before do
    		@store.delete @item
    	end

    	it "should have no items left" do
    		@store.length.must_equal 0
    	end
    end

    describe "reducing stock level" do
    	before do
    		@store.take(@item, 1)
    	end

    	it "should reduce the quantity by 1" do
    		@item.quantity.must_equal 4
    	end

    	describe "notifications" do
    		before do
    			@store.take(@item, 2)
    			@supplier = Supplier.new
    		end

      	it "should notify the supplier when the quantity falls below 3 and
      	create an order for the item" do
      		@item.supplier.orders.first.must_equal @item
      	end

      	it "should return a warning message" do
      		@supplier.notify(@item).must_equal "You're low on Loaf of Bread"
      	end
      end
    end

    describe "Report" do
      describe "in plain text" do
      	before do
          @report = Report.new(@store.all, :text)
        end

        it "should know how to make a header" do
          @report.make_header.must_match /Stock Report/
        end

        it "should know how to make the body" do
          @report.make_body.must_match /Loaf/
        end

        it "should know how to make the footer" do
          @report.make_footer.must_match //
        end

        describe "Report" do
          describe "in html text" do
            before do
              @report = Report.new(@store.all, :text)
            end

            it "should know how to make a header" do
              @report.make_header.must_match /Stock Report/
            end

            it "should know how to make the body" do
              @report.make_body.must_match /Loaf/
            end

             it "should know how to make the footer" do
              @report.make_footer.must_match /Stock Report/
            end
          end
        end
      end
    end
  end
end


