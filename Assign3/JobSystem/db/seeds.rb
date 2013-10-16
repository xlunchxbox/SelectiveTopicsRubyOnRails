Worker.create!(first_name: 'Chris', last_name: 'Cruz')
Worker.create!(first_name: 'Ryan', last_name: 'Lee')
Worker.create!(first_name: 'Homer', last_name: 'Simpson')
Worker.create!(first_name: 'Peter', last_name: 'Griffin')
Worker.create!(first_name: 'Brock', last_name: 'Sampson')

WorkOrder.create!(details: 'A work order', status: 'created', worker_id: 1)
WorkOrder.create!(details: 'New customer', status: 'review', worker_id: 1)
WorkOrder.create!(details: 'New urgent work order', status: 'in progress', worker_id: 1)
WorkOrder.create!(details: 'ASAP!!!', status: 'completed', worker_id: 1)

WorkOrder.create!(details: 'ASAP!!!', status: 'created', worker_id: 2)
WorkOrder.create!(details: 'urgent!', status: 'review', worker_id: 2)
WorkOrder.create!(details: 'new customer', status: 'in progress', worker_id: 2)
WorkOrder.create!(details: 'important order', status: 'completed', worker_id: 2)

WorkOrder.create!(details: 'needs new parts', status: 'created', worker_id: 3)
WorkOrder.create!(details: 'manager approval', status: 'review', worker_id: 3)
WorkOrder.create!(details: 'waiting on parts', status: 'in progress', worker_id: 3)
WorkOrder.create!(details: 'awaiting payment', status: 'completed', worker_id: 3)

