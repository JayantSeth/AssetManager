class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tables do |t|
      t.string :username 
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
