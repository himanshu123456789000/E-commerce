require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it "requires a product" do
      product = FactoryBot.create(:product)
      expect(product).to be_valid
    end
  end
end
