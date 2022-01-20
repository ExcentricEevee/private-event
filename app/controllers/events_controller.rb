class EventsController < ApplicationController

    def index
        @user = current_user
        @events = Event.all
    end
end
