class CreateTableEventAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendees do |t|
      t.belongs_to :event_attendee
      t.belongs_to :attended_event

      t.timestamps
    end
  end
end
