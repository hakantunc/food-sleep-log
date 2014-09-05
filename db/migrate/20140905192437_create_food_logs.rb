class CreateFoodLogs < ActiveRecord::Migration
  def change
    create_table :food_logs do |t|
      t.date :date
      t.string :morning
      t.string :afternoon
      t.string :evening
      t.string :night

      t.timestamps
    end
  end
end
