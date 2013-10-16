require './driver'

def menu
  choice = 0
  while choice != 8
    puts "Please make a selection"
    puts "1) Display all workers"
    puts "2) Display all work orders"
    puts "3) Display open work orders by worker"
    puts "4) Display work orders by status"
    puts "5) Assign work order to new worker"
    puts "6) Assign work order to existing Worker"
    puts "7) Create a new worker"
    puts "8) Quit\n"
  
    STDOUT.flush
    choice = gets.chomp.to_i
    router(choice)
  end
end

def sub_menu(choice)
  if choice == 3
    puts "Please enter a Worker ID"
    STDOUT.flush
    option = gets.chomp.to_i
    return option   
  end
  
  if choice == 4
    puts "Please enter a status to search for"
    STDOUT.flush
    return option = gets.chomp.downcase
  end
  
  if choice == 5
    answers = Array.new
    puts "Please enter a First and Last name, and a description for the work order"
    STDOUT.flush
    answers << gets.chomp
    answers << gets.chomp
    answers << gets.chomp
    return answers
  end
  
  if choice == 6
    answers = Array.new
    display_workers(get_all_workers)
    puts "Please choose a current worker, and enter the work order details"
    answers << gets.chomp.to_i
    answers << gets.chomp
    return answers
  end
  if choice == 7
    answers = Array.new
    puts "Please enter a first and last name"
    answers << gets.chomp
    answers << gets.chomp
    return answers
  end
end

def router(choice)
  case choice
    when 1
      display_workers(get_all_workers)
    when 2
      display_work_orders(get_all_work_orders)
    when 3
      begin
        display_work_orders(get_incomplete_work_orders(Worker.find(sub_menu(choice))))
      rescue ActiveRecord::RecordNotFound
        puts `clear`
        puts "Please enter a valid Worker ID" 
      end
    when 4
        display_work_orders(get_work_orders_by_status(sub_menu(choice)))
    when 5
      option = sub_menu(choice)
      begin
        assign_work_order(create_worker(option[0], option[1]), option[2])
      rescue
        puts `clear`
        puts "Please enter valid information"
      end
    when 6
      option = sub_menu(choice)
      begin
        assign_work_order(get_worker_by_id(option[0]), option[1])
      rescue ActiveRecord::RecordNotFound
        puts `clear`
        puts "Please enter a valid Worker ID"
      end
    when 7
      option = sub_menu(choice)
      create_worker(option[0], option[1])
    when 8
      abort ("Thank you for using the Worker System")
  end
end

menu
