class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

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

    def edit
        @event = Event.find(params[:id])
        if current_user.id != @event.creator_id
            #surely there is a better way
            redirect_to @event, notice: "You can't do that! 3:"
        end
    end

    def update
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to @event
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to root_path
    end
    
    private

    def event_params
        params.require(:event).permit(:title, :location, :date, :description)
    end
end
