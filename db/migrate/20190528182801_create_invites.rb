class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :event_id
      t.integer :invitor_id
      t.string :invite_status

      t.timestamps
    end
  end
end
