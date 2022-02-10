class EventAttendeesController < ApplicationController
    def new

    end

    def create
        #@event = Event.find(params[:event_id])
        @event_attendee = EventAttendee.new(event_attendee_id: current_user.id, attended_event_id: @event.id)

    end
end
