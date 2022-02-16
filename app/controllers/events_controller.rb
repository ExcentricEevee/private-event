class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        @event_attendees = EventAttendee.where(attended_event_id: @event.id)
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to @event
        else
            render :new
        end
    end
    
    private

    def event_params
        params.require(:event).permit(:title, :location, :date, :description)
    end
end
