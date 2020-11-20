class Menu < ApplicationRecord
  validates :menu_type, inclusion: { in: %w(breakfast lunch dinner today_special),
                                     message: "invalid menu type" }



  def self.current_day_order
    return  Menu.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
