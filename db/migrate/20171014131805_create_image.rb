class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :fraud_id
      t.timestamps
    end
  end
end
