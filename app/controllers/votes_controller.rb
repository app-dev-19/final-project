class VotesController < ApplicationController
  def index
    @votes = Vote.all

    render("vote_templates/index.html.erb")
  end

  def show
    @vote = Vote.find(params.fetch("id_to_display"))

    render("vote_templates/show.html.erb")
  end

  def new_form
    @vote = Vote.new

    render("vote_templates/new_form.html.erb")
  end

  def create_row
    @vote = Vote.new

    @vote.proposed_time_id = params.fetch("proposed_time_id")
    @vote.voter_id = params.fetch("voter_id")
    @vote.event_id = params.fetch("event_id")

    if @vote.valid?
      @vote.save

      redirect_back(:fallback_location => "/votes", :notice => "Vote created successfully.")
    else
      render("vote_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @vote = Vote.find(params.fetch("prefill_with_id"))

    render("vote_templates/edit_form.html.erb")
  end

  def update_row
    @vote = Vote.find(params.fetch("id_to_modify"))

    @vote.proposed_time_id = params.fetch("proposed_time_id")
    @vote.voter_id = params.fetch("voter_id")
    @vote.event_id = params.fetch("event_id")

    if @vote.valid?
      @vote.save

      redirect_to("/votes/#{@vote.id}", :notice => "Vote updated successfully.")
    else
      render("vote_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @vote = Vote.find(params.fetch("id_to_remove"))

    @vote.destroy

    redirect_to("/votes", :notice => "Vote deleted successfully.")
  end
end
