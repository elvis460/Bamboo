class Order < ActiveRecord::Base
	has_many :products
	serialize :product_id
	serialize :count
end
