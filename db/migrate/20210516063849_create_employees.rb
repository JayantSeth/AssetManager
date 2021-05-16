class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :emp_name 
      t.string :emp_code 
      t.string :designation 
      t.string :contact 
      t.string :email 
      t.datetime :emp_joining_date 
      t.integer :department_id 
      t.integer :location_id
      t.timestamps
    end
  end
end
