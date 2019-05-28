class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.integer :event_id
      t.integer :member_id

      t.timestamps
    end
  end
end
