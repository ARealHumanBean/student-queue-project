class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.belongs_to :user, index: { unique: true }
      t.integer :queue_type, null:false
      t.text :info
      t.timestamps
    end
  end
end
