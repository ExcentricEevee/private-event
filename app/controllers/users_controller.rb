class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @events_attended = EventAttendee.where(event_attendee_id: @user.id)
    end
end
