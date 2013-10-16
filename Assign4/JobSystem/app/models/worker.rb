class Worker < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  has_many :work_orders
end
