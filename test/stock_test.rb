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

  		it "should consider two items as the same, if they share the same title" do
  			@item.must_equal Item.new(:title => "Loaf of Bread")
  			@item.wont_equal Item.new(:title => "Cornfakes")
  		end
  	

      describe "Create an Item" do
      	before do
      		@store.add @item
      	end

      	it "should now be stored in the store" do
      		@store.length.must_equal 1
      		@store.last.must_equal @item
      	end
      end

      describe "Read Items" do
      	before do
      		@store.add @item
      	end

      	it "should find an array of all items" do
      		@store.all.must_equal [@item]
        end
      end
      
      describe "Updating Item" do
      	before do
      		@store.add  @item
      		@updated = @store.update(@item, {:quantity => 7})
      	end

      	it "should be able to update an item" do
      		@updated.quantity.must_equal 7
      	end
      end
      
      describe "Deleting an Item" do
      	before do
      		@store.add  @item
      		@store.delete @item
      	end

      	it "should have no items left" do
      		@store.length.must_equal 0
      	end
      end
    end
  end





















 