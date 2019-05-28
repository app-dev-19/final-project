class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :proposed_time_id
      t.integer :voter_id
      t.integer :event_id

      t.timestamps
    end
  end
end
