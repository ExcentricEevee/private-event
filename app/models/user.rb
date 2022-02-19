class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #one-to-many
  has_many :events, foreign_key: :creator_id, class_name: "Event", dependent: :delete_all
  #many-to-many attendees with events, using a through table called event_attendees
  #this line establishes what the foregin key for an attendee is in the event_attendees through table
  has_many :event_attendees, foreign_key: :event_attendee_id
  #hopefully we're not accidently deleting all events that were attended, and just this user's sign up, snrk
  has_many :attended_events, through: :event_attendees, source: :attended_event, dependent: :delete_all

  validates :username, presence: true, length: { minimum: 2 }, uniqueness: true
end
