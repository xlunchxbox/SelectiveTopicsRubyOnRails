require './worker'
require './work_order'

Worker.create(first_name: 'Ryan', last_name: 'Lee')
Worker.create(first_name: 'Chris', last_name: 'Cruz')
Worker.create(first_name: 'Chewy', last_name: 'Chiu')
Worker.create(first_name: 'Victor', last_name: 'Hugo')

Worker.find(1).work_orders.create(work_details: 'This is a sample work order', date_of_creation: DateTime.now, status: 'created', status_update_date: DateTime.now)
Worker.find(1).work_orders.create(work_details: 'This is another sample work order', date_of_creation: DateTime.now, status: 'created', status_update_date: DateTime.now)
Worker.find(2).work_orders.create(work_details: 'This is yet another sample work order', date_of_creation: DateTime.now, status: 'in progress', status_update_date: DateTime.now)
Worker.find(2).work_orders.create(work_details: 'Look more text!', date_of_creation: DateTime.now, status: 'review', status_update_date: DateTime.now)
Worker.find(3).work_orders.create(work_details: 'This work order is awesome', date_of_creation: DateTime.now, status: 'review', status_update_date: DateTime.now)
Worker.find(3).work_orders.create(work_details: 'Ruby!', date_of_creation: DateTime.now, status: 'completed' , status_update_date: DateTime.now)
