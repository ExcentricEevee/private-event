class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @events_attended = EventAttendee.where(event_attendee_id: @user.id)
    end
end
