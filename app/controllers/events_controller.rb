class EventsController < ApplicationController
  def index
    # @events = Event.where(:user_id => current_user.id)
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
    @contact = Contact.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.user_id = params[:user_id]
    @event.notes = params[:notes]
    @event.location = params[:location]
    @event.description = params[:description]
    @event.held_on = params[:held_on]
    @event.title = params[:title]

    if @event.save
      redirect_to "/events/#{@event.id}", :notice => "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.user_id = params[:user_id]
    @event.notes = params[:notes]
    @event.location = params[:location]
    @event.description = params[:description]
    @event.held_on = params[:held_on]
    @event.title = params[:title]

    if @event.save
      redirect_to "/events/#{@event.id}", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Event deleted."
  end
end
