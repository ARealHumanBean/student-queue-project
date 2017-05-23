class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :type, null:false
      t.text :info
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
