require 'factory_girl'
require File.expand_path('../worker', __FILE__)

FactoryGirl.define do
  factory :worker do |worker|
    worker.first_name          'FirstName'
    worker.last_name           'LastName'
  end

  factory :work_order do |work_order|
    work_order.work_details        'The details of this work'
    work_order.date_of_creation    DateTime.now
    work_order.status              'in progress'
    work_order.status_update_date  DateTime.now
    work_order.association :worker
  end
end
