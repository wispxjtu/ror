class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
    # If the line_item price is different with product price, use the product price
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
  		current_item.quantity +=1
  	else
  		current_item = line_items.build(:product_id => product_id)
  	end
    # set price
    current_item.price = current_item.product.price
  	current_item
  end

  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end
end
