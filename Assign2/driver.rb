require 'active_record'
require './worker'
require './work_order'
require './setup'
require 'date'

def create_worker(first, last)
	Worker.create(:first_name => first, :last_name => last)
end

def get_all_workers
	workers = Worker.all
end

def get_worker_by_id(id)
  worker = Worker.find(id)
end

def assign_work_order(worker, details)
	worker.work_orders.create(:work_details => details, :date_of_creation => DateTime.now,
		:status => 'created', :status_update_date => DateTime.now)
end

def get_incomplete_work_orders(worker)
	work_orders = worker.work_orders.where("status != 'completed'")
end

def get_work_orders_by_status(status)
	work_orders = WorkOrder.where("status = '#{status}'")
end

def get_all_work_orders
	work_orders = WorkOrder.all
end

def display_workers(workers)
  puts `clear`
	puts "WORKER_LIST:\nID \t FIRST_NAME \t LAST_NAME"
	workers.each {|worker| puts "#{worker.id} \t #{worker.first_name} \t #{worker.last_name}"}
end

def display_work_orders(work_orders)
  puts `clear`
	puts "WORK_ORDER_LIST:\nID \t WORKER_ID \t DATE_OF_CREATION \t ORDER_STATUS \t ORDER_STATUS_UPDATE_DATE \t WORK_DETAILS"
	work_orders.each {|order| puts "#{order.id} \t #{order.worker_id} \t\t #{order.date_of_creation} \t #{order.status} \t #{order.status_update_date} \t #{order.work_details} "}
end


# display_workers(get_all_workers)
# display_work_orders(get_all_work_orders)
# assign_work_order(get_worker_by_id(1), 'This is the details')
# display_work_orders(get_work_orders_by_status('in progress'))
# display_work_orders(get_incomplete_work_orders(Worker.find(3)))