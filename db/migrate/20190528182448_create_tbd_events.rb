class CreateTbdEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :tbd_events do |t|
      t.string :event_name
      t.string :event_desc
      t.time :window_begin
      t.time :window_end
      t.integer :min_length
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.string :end_date
      t.string :location
      t.integer :creator_id

      t.timestamps
    end
  end
end
