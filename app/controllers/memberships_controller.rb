class MembershipsController < ApplicationController
  def add_membership
      @event_id = params.fetch("event_id")
      @event = TbdEvent.all.where({:id => @event_id}).first
      #@members = @event.memberships.pluck(:member_id)
      @users = @event.invitees
      #@users = User.all.where({:id => @members})
      render("tbd_event_templates/add_membership.html.erb")
  end
  
  def save_membership
      @new_memb = Membership.new
      @new_memb.event_id = params.fetch("event_id")
      @new_memb.member_id = params.fetch("member_id")
      @new_memb.save
      
      @event_id = @new_memb.event_id
      @event = TbdEvent.all.where({:id => @event_id}).first
      #@members = @event.memberships.pluck(:member_id)
      @users = @event.invitees
      #@users = User.all.where({:id => @members})
      redirect_to("/event/add_users/"+@event_id.to_s)
  end
  
  def index
    @memberships = Membership.all

    render("membership_templates/index.html.erb")
  end

  def show
    @membership = Membership.find(params.fetch("id_to_display"))

    render("membership_templates/show.html.erb")
  end

  def new_form
    @membership = Membership.new

    render("membership_templates/new_form.html.erb")
  end

  def create_row
    @membership = Membership.new

    @membership.event_id = params.fetch("event_id")
    @membership.member_id = params.fetch("member_id")

    if @membership.valid?
      @membership.save

      redirect_back(:fallback_location => "/memberships", :notice => "Membership created successfully.")
    else
      render("membership_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @membership = Membership.find(params.fetch("prefill_with_id"))

    render("membership_templates/edit_form.html.erb")
  end

  def update_row
    @membership = Membership.find(params.fetch("id_to_modify"))

    @membership.event_id = params.fetch("event_id")
    @membership.member_id = params.fetch("member_id")

    if @membership.valid?
      @membership.save

      redirect_to("/memberships/#{@membership.id}", :notice => "Membership updated successfully.")
    else
      render("membership_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @membership = Membership.find(params.fetch("id_to_remove"))

    @membership.destroy

    redirect_to("/memberships", :notice => "Membership deleted successfully.")
  end
end
