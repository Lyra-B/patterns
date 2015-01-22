require 'minitest/autorun'
require './item'
require './store'
require 'date'

	class StockTest < Minitest::Test
  	describe 'The stock System' do
  		before do
  			@item = Item.new(:quantity => 5, :title => "Loaf of Bread", 
  				:price => 1.0,  :best_before => Date.new(2015, 2, 1), 
  				:purchase_date => Date.new(2015, 1, 22),:supplier => "Sainsbury Ltd.", 
  				:supplier_contact => "Mr Smith", :supplier_number =>"12345 6789012")
  			@store = Store.new
  		end

      describe "Create an Item" do
      	before do
      		@store.add @item
      	end

      	it "should now be stored in the store" do
      		@store.length.must_equal 1
      		@store.items.last.must_equal @item
      	end

      end
      describe "Read Items" do
      	
      end
      describe "Updating Item" do
      	
      end
      describe "Deleting an Item" do
      	
      end



  	end
  end

 