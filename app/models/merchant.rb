class Merchant < ApplicationRecord
    belongs_to :user
    has_many :items, dependent: :delete_all

    has_many :transactions,  dependent: :destroy
  
    def owner
      user
    end
  
    def set_fee(amount)
      update_attribute(:fee, amount)
    end
  end
  