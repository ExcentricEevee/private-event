class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    #this line establishes how an event can have many attendees (Users) with the through table EventAttendee
    #source is saying "find the attendee in EventAttendee with :event_attendee_id, not user_id or w/e"
    has_many :attendees, through: :event_attendees, source: :event_attendee
    #this line establishes how it can have many instances of EventAttendee
    has_many :event_attendees, foreign_key: :attended_event_id, dependent: :delete_all

    scope :past, -> { where('date < ?', Time.now) }
    scope :upcoming, -> { where('date > ?', Time.now) }
 
    validates :creator_id, presence: true
    validates :title, presence: true, length: { in: 1..50}
    validates :location, presence: true, length: { in:  1..100}
    validates_date :date
end
