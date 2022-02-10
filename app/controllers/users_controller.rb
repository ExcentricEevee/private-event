class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @events_attended = EventAttendee.where(attended_event_id: @user.id)
    end
end
