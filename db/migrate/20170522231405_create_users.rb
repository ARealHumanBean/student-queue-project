class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.camosun_id :string, null:false, limit: 8
      t.role :integer, null:false
      t.first_name :string, limit: 20
      t.last_name :string, limit: 20
      t.timestamps
    end
    add_index :users, :camosun_id, unique: true
  end
end
