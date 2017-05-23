class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :camosun_id, null:false, limit: 8
      t.integer :role, null:false
      t.string :first_name, limit: 20
      t.string :last_name, limit: 20
      t.timestamps
    end
    add_index :users, :camosun_id, unique: true
  end
end
