class RegisteredNumber < ActiveRecord::Migration
  def change
    create_table :registered_numbers do |t|
      t.string :number

      t.timestamps
    end
  end
end
