class Task < ApplicationRecord

def self.search(user)
    if search

        @user = User.find_by( name: search)
        if @user
            self.where(user_id: user)
      else
        @user = User.all
      end
    else
        User.all
  end
end
