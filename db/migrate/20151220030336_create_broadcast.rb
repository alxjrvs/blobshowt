class CreateBroadcast < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.text :body, limit: 140

      t.timestamps
    end
  end
end
