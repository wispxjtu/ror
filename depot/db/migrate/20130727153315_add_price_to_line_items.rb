class AddPriceToLineItems < ActiveRecord::Migration
  def up
  	add_column :line_items, :price, :decimal
  	Cart.all.each do |cart|
  		cart.line_items.each do |item|
	  		item.price = item.product.price
	  		item.save
	  	end
  	end
  end
  def down
  	remove_column :line_items, :price, :decimal
  end
end
