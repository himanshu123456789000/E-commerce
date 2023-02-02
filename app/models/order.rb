class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :address
  before_create :assign_transaction_id

  private 
  def assign_transaction_id 
    self.transaction_id = SecureRandom.uuid 
  end
end
