class TbdEventsController < ApplicationController
  def past_events_page
    render("tbd_event_templates/past_events.html.erb")
  end
  
  def new_event
    render("tbd_event_templates/new_event.html.erb")
  end
  
  def event_details
    event_id = params.fetch("event_id")
    @event = TbdEvent.all.where({:id => event_id}).first
    render("tbd_event_templates/event_details.html.erb")
  end
  
  def save_event
    @event = TbdEvent.new
    @event.creator_id = params.fetch("creator_id")
    @event.event_name = params.fetch("event_name")
    @event.event_desc = params.fetch("event_desc")
    @event.min_length = params.fetch("min_length")
    @event.location = params.fetch("location")
    @event.save
    
    event_id = @event.id
    @first_memb = Membership.new
    @first_memb.event_id = event_id
    @first_memb.member_id = @event.creator_id
    @first_memb.save
    
    redirect_to("/event/add_users/"+event_id.to_s)
  end
  
  def event_delete
    event_id = params.fetch("event_id")
    @event = TbdEvent.all.where({:id => event_id}).first
    @event.destroy
    redirect_to("/dashboard")
  end
  
  def index
    @tbd_events = TbdEvent.all

    render("tbd_event_templates/index.html.erb")
  end

  def show
    @tbd_event = TbdEvent.find(params.fetch("id_to_display"))

    render("tbd_event_templates/show.html.erb")
  end

  def new_form
    @tbd_event = TbdEvent.new

    render("tbd_event_templates/new_form.html.erb")
  end

  def create_row
    @tbd_event = TbdEvent.new

    @tbd_event.event_name = params.fetch("event_name")
    @tbd_event.event_desc = params.fetch("event_desc")
    @tbd_event.window_begin = params.fetch("window_begin")
    @tbd_event.window_end = params.fetch("window_end")
    @tbd_event.min_length = params.fetch("min_length")
    @tbd_event.start_time = params.fetch("start_time")
    @tbd_event.end_time = params.fetch("end_time")
    @tbd_event.start_date = params.fetch("start_date")
    @tbd_event.end_date = params.fetch("end_date")
    @tbd_event.location = params.fetch("location")
    @tbd_event.creator_id = params.fetch("creator_id")

    if @tbd_event.valid?
      @tbd_event.save

      redirect_back(:fallback_location => "/tbd_events", :notice => "Tbd event created successfully.")
    else
      render("tbd_event_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tbd_event = TbdEvent.find(params.fetch("prefill_with_id"))

    render("tbd_event_templates/edit_form.html.erb")
  end

  def update_row
    @tbd_event = TbdEvent.find(params.fetch("id_to_modify"))

    @tbd_event.event_name = params.fetch("event_name")
    @tbd_event.event_desc = params.fetch("event_desc")
    @tbd_event.window_begin = params.fetch("window_begin")
    @tbd_event.window_end = params.fetch("window_end")
    @tbd_event.min_length = params.fetch("min_length")
    @tbd_event.start_time = params.fetch("start_time")
    @tbd_event.end_time = params.fetch("end_time")
    @tbd_event.start_date = params.fetch("start_date")
    @tbd_event.end_date = params.fetch("end_date")
    @tbd_event.location = params.fetch("location")
    @tbd_event.creator_id = params.fetch("creator_id")

    if @tbd_event.valid?
      @tbd_event.save

      redirect_to("/tbd_events/#{@tbd_event.id}", :notice => "Tbd event updated successfully.")
    else
      render("tbd_event_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @tbd_event = TbdEvent.find(params.fetch("id_to_remove"))

    @tbd_event.destroy

    redirect_to("/tbd_events", :notice => "Tbd event deleted successfully.")
  end
end
