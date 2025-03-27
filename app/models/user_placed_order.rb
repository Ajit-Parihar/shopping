class UserPlacedOrder < ApplicationRecord
   belongs_to :product
   belongs_to :user

   def delivered?
      Time.current >= start_time + 2.minutes
    end
end
