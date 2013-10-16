class WorkOrder < ActiveRecord::Base
  validates_presence_of :worker_id, :work_details, :date_of_creation, :status, :status_update_date
  validates_inclusion_of :status, :in => ['created', 'in progress', 'review', 'completed']
  belongs_to :worker  
end
