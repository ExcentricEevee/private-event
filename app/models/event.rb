class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    #many-to-many attendees with events, using a through table called event_attendees
    #this line establishes how an event can have many attendees (Users) with the through table event_attendees
    has_many :attendees, through: :event_attendees, source: :event_attendee
    #this establishes 
    has_many :event_attendees, foreign_key: :attended_event_id

    scope :past, -> { where('date < ?', Time.now) }
    scope :upcoming, -> { where('date > ?', Time.now) }
end
