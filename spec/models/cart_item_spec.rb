require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "validations" do
    it "requires a cart_item" do
      product = FactoryBot.create(:product)
      user = User.find(product.user_id)
      cart_item = FactoryBot.create(:cart_item, cart_id: user.cart.id, product_id: product.id)
      expect(cart_item).to be_valid
    end
  end
end
