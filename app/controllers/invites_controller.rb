class InvitesController < ApplicationController
  def index
    @invites = Invite.all

    render("invite_templates/index.html.erb")
  end

  def show
    @invite = Invite.find(params.fetch("id_to_display"))

    render("invite_templates/show.html.erb")
  end

  def new_form
    @invite = Invite.new

    render("invite_templates/new_form.html.erb")
  end

  def create_row
    @invite = Invite.new

    @invite.email = params.fetch("email")
    @invite.event_id = params.fetch("event_id")
    @invite.invitor_id = params.fetch("invitor_id")
    @invite.invite_status = params.fetch("invite_status")

    if @invite.valid?
      @invite.save

      redirect_back(:fallback_location => "/invites", :notice => "Invite created successfully.")
    else
      render("invite_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @invite = Invite.find(params.fetch("prefill_with_id"))

    render("invite_templates/edit_form.html.erb")
  end

  def update_row
    @invite = Invite.find(params.fetch("id_to_modify"))

    @invite.email = params.fetch("email")
    @invite.event_id = params.fetch("event_id")
    @invite.invitor_id = params.fetch("invitor_id")
    @invite.invite_status = params.fetch("invite_status")

    if @invite.valid?
      @invite.save

      redirect_to("/invites/#{@invite.id}", :notice => "Invite updated successfully.")
    else
      render("invite_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @invite = Invite.find(params.fetch("id_to_remove"))

    @invite.destroy

    redirect_to("/invites", :notice => "Invite deleted successfully.")
  end
end
