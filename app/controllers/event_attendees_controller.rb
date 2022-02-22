class EventAttendeesController < ApplicationController
    def create
        #:event_id is passed from the link_to inside views/events/show.html.erb
        @event = Event.find(params[:event_id])
        @event_attendee = EventAttendee.new(event_attendee_id: current_user.id, attended_event_id: @event.id)

        #Prevent users from signing up for the same event multiple times
        if EventAttendee.exists?(event_attendee_id: current_user.id, attended_event_id: @event.id)
            redirect_to @event, notice: "You're already attending this event!"
        else
            @event_attendee.save
            redirect_to @event, notice: "You are now attending this event!"
        end
    end

    def destroy
        @event = Event.find(params[:event_id])
        @event_attendee = EventAttendee.find_by(event_attendee_id: current_user.id, attended_event_id: @event.id)
        @event_attendee.destroy

        redirect_to @event, notice: "You have left this event"
    end
end
