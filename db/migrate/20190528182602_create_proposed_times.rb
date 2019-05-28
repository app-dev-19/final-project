class CreateProposedTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :proposed_times do |t|
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.integer :meeting_id

      t.timestamps
    end
  end
end
