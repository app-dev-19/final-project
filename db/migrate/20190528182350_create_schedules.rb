class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :owner_id
      t.string :event_name
      t.string :event_cal
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
