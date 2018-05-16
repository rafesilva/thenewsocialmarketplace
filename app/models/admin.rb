class Admin < ApplicationRecord

    def set_fee(amount)
        update_attribute(:fee, amount)
      end

end
