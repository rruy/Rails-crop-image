class CreateFraud < ActiveRecord::Migration
  def change
    create_table :frauds do |t|
      t.string :title
    end
  end
end
