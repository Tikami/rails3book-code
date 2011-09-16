# encoding: utf-8
class EventsController < ApplicationController
  
  before_filter :find_event, :only => [ :show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.save

    flash[:notice] = "event was successfully created"
    redirect_to :action => :index
  end
  
  def show
    @page_title = @event.name
  end
  
  def edit
  end
  
  def update
    @event.update_attributes(params[:event])

    flash[:notice] = "event was successfully updated"
    redirect_to :action => :show, :id => @event
  end
  
  def destroy
    @event.destroy

    flash[:alert] = "event was successfully deleted"
    redirect_to :action => :index
  end
  
  protected

  def find_event
    @event = Event.find(params[:id])
  end
    
end