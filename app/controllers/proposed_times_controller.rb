class ProposedTimesController < ApplicationController
  def index
    @proposed_times = ProposedTime.all

    render("proposed_time_templates/index.html.erb")
  end

  def show
    @proposed_time = ProposedTime.find(params.fetch("id_to_display"))

    render("proposed_time_templates/show.html.erb")
  end

  def new_form
    @proposed_time = ProposedTime.new

    render("proposed_time_templates/new_form.html.erb")
  end

  def create_row
    @proposed_time = ProposedTime.new

    @proposed_time.start_time = params.fetch("start_time")
    @proposed_time.end_time = params.fetch("end_time")
    @proposed_time.start_date = params.fetch("start_date")
    @proposed_time.end_date = params.fetch("end_date")
    @proposed_time.meeting_id = params.fetch("meeting_id")

    if @proposed_time.valid?
      @proposed_time.save

      redirect_back(:fallback_location => "/proposed_times", :notice => "Proposed time created successfully.")
    else
      render("proposed_time_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @proposed_time = ProposedTime.find(params.fetch("prefill_with_id"))

    render("proposed_time_templates/edit_form.html.erb")
  end

  def update_row
    @proposed_time = ProposedTime.find(params.fetch("id_to_modify"))

    @proposed_time.start_time = params.fetch("start_time")
    @proposed_time.end_time = params.fetch("end_time")
    @proposed_time.start_date = params.fetch("start_date")
    @proposed_time.end_date = params.fetch("end_date")
    @proposed_time.meeting_id = params.fetch("meeting_id")

    if @proposed_time.valid?
      @proposed_time.save

      redirect_to("/proposed_times/#{@proposed_time.id}", :notice => "Proposed time updated successfully.")
    else
      render("proposed_time_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @proposed_time = ProposedTime.find(params.fetch("id_to_remove"))

    @proposed_time.destroy

    redirect_to("/proposed_times", :notice => "Proposed time deleted successfully.")
  end
end
