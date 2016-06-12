class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.integer :no_of_records_crowled
      t.string  :url
      t.timestamps null: false
    end
  end
end
