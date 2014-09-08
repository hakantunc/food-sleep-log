class CreateSleepLogs < ActiveRecord::Migration
  def change
    create_table :sleep_logs do |t|
      t.date :date
      t.datetime :sleep
      t.datetime :wake_up

      t.timestamps
    end
  end
end
