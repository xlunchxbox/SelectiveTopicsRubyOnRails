class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :details
      t.string :status
      t.integer :worker_id

      t.timestamps
    end
  end
end
