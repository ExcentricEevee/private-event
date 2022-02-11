class EventAttendeesController < ApplicationController
    def create
        #:event_id is passed from the link_to inside views/events/show.html.erb
        @event = Event.find(params[:event_id])
        #use #create instead of #new and #save since we're not relying on user input, and a user MUST be signed in
        #TODO: check to see if the user:event pair already exists in database; if so, do not create another one.
        @event_attendee = EventAttendee.create(event_attendee_id: current_user.id, attended_event_id: @event.id)
        redirect_to @event
    end
end
