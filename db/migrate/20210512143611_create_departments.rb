class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :department 
      t.string :comment
      t.timestamps
    end
  end
end
