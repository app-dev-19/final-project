class SchedulesController < ApplicationController
  def manual_entry
    render("schedule_templates/manual_entry.html.erb")
  end
  
  def save_manual_entry
    @schedule = Schedule.new
    @schedule.owner_id = params.fetch("owner_id")
    @schedule.event_name = params.fetch("event_name")
    @schedule.event_cal = params.fetch("event_cal")
    @schedule.start_time = params.fetch("start_time")
    @schedule.end_time = params.fetch("end_time")
    @schedule.start_date = params.fetch("start_date")
    @schedule.end_date = params.fetch("end_date")
    
    if @schedule.valid?
      @schedule.save
      redirect_to("/schedule/new")
    else
      render("schedule_templates/new_form_with_errors.html.erb")
    end
    
  end
  
  def index
    @schedules = Schedule.all

    render("schedule_templates/index.html.erb")
  end

  def show
    @schedule = Schedule.find(params.fetch("id_to_display"))

    render("schedule_templates/show.html.erb")
  end

  def new_form
    @schedule = Schedule.new

    render("schedule_templates/new_form.html.erb")
  end

  def create_row
    @schedule = Schedule.new

    @schedule.owner_id = params.fetch("owner_id")
    @schedule.event_name = params.fetch("event_name")
    @schedule.event_cal = params.fetch("event_cal")
    @schedule.start_time = params.fetch("start_time")
    @schedule.end_time = params.fetch("end_time")
    @schedule.start_date = params.fetch("start_date")
    @schedule.end_date = params.fetch("end_date")

    if @schedule.valid?
      @schedule.save

      redirect_back(:fallback_location => "/schedules", :notice => "Schedule created successfully.")
    else
      render("schedule_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @schedule = Schedule.find(params.fetch("prefill_with_id"))

    render("schedule_templates/edit_form.html.erb")
  end

  def update_row
    @schedule = Schedule.find(params.fetch("id_to_modify"))

    @schedule.owner_id = params.fetch("owner_id")
    @schedule.event_name = params.fetch("event_name")
    @schedule.event_cal = params.fetch("event_cal")
    @schedule.start_time = params.fetch("start_time")
    @schedule.end_time = params.fetch("end_time")
    @schedule.start_date = params.fetch("start_date")
    @schedule.end_date = params.fetch("end_date")

    if @schedule.valid?
      @schedule.save

      redirect_to("/schedules/#{@schedule.id}", :notice => "Schedule updated successfully.")
    else
      render("schedule_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @schedule = Schedule.find(params.fetch("id_to_remove"))

    @schedule.destroy

    redirect_to("/schedules", :notice => "Schedule deleted successfully.")
  end
end
