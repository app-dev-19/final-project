Rails.application.routes.draw do


  #------------------------------
  
  # Omniauth
  # https://readysteadycode.com/howto-integrate-google-calendar-with-rails
  get '/redirect', to: 'gsessions#redirect', as: 'redirect'
  get '/callback', to: 'gsessions#callback', as: 'callback'
  get '/calendars', to: 'gsessions#calendars', as: 'calendars'
  
  
  #------------------------------
  
  # Created by Neil Sethi
  
  # SPLASH
  match("", { :controller => "splash", :action => "show_page", :via => "get"})
  
  # DASHBOARD
  match("/dashboard", { :controller => "dashboards", :action => "show_page", :via => "get"})
  
  # TBD_EVENTS
  match("/tbd_events/past_events", { :controller => "tbd_events", :action => "past_events_page", :via => "get"})
  
  
  #------------------------------
  
  # Routes for the Invite resource:

  # CREATE
  get("/invites/new", { :controller => "invites", :action => "new_form" })
  post("/create_invite", { :controller => "invites", :action => "create_row" })

  # READ
  get("/invites", { :controller => "invites", :action => "index" })
  get("/invites/:id_to_display", { :controller => "invites", :action => "show" })

  # UPDATE
  get("/invites/:prefill_with_id/edit", { :controller => "invites", :action => "edit_form" })
  post("/update_invite/:id_to_modify", { :controller => "invites", :action => "update_row" })

  # DELETE
  get("/delete_invite/:id_to_remove", { :controller => "invites", :action => "destroy_row" })

  #------------------------------

  # Routes for the Vote resource:

  # CREATE
  get("/votes/new", { :controller => "votes", :action => "new_form" })
  post("/create_vote", { :controller => "votes", :action => "create_row" })

  # READ
  get("/votes", { :controller => "votes", :action => "index" })
  get("/votes/:id_to_display", { :controller => "votes", :action => "show" })

  # UPDATE
  get("/votes/:prefill_with_id/edit", { :controller => "votes", :action => "edit_form" })
  post("/update_vote/:id_to_modify", { :controller => "votes", :action => "update_row" })

  # DELETE
  get("/delete_vote/:id_to_remove", { :controller => "votes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Membership resource:

  # CREATE
  get("/memberships/new", { :controller => "memberships", :action => "new_form" })
  post("/create_membership", { :controller => "memberships", :action => "create_row" })

  # READ
  get("/memberships", { :controller => "memberships", :action => "index" })
  get("/memberships/:id_to_display", { :controller => "memberships", :action => "show" })

  # UPDATE
  get("/memberships/:prefill_with_id/edit", { :controller => "memberships", :action => "edit_form" })
  post("/update_membership/:id_to_modify", { :controller => "memberships", :action => "update_row" })

  # DELETE
  get("/delete_membership/:id_to_remove", { :controller => "memberships", :action => "destroy_row" })

  #------------------------------

  # Routes for the Proposed time resource:

  # CREATE
  get("/proposed_times/new", { :controller => "proposed_times", :action => "new_form" })
  post("/create_proposed_time", { :controller => "proposed_times", :action => "create_row" })

  # READ
  get("/proposed_times", { :controller => "proposed_times", :action => "index" })
  get("/proposed_times/:id_to_display", { :controller => "proposed_times", :action => "show" })

  # UPDATE
  get("/proposed_times/:prefill_with_id/edit", { :controller => "proposed_times", :action => "edit_form" })
  post("/update_proposed_time/:id_to_modify", { :controller => "proposed_times", :action => "update_row" })

  # DELETE
  get("/delete_proposed_time/:id_to_remove", { :controller => "proposed_times", :action => "destroy_row" })

  #------------------------------

  # Routes for the Tbd event resource:

  # CREATE
  get("/tbd_events/new", { :controller => "tbd_events", :action => "new_form" })
  post("/create_tbd_event", { :controller => "tbd_events", :action => "create_row" })

  # READ
  get("/tbd_events", { :controller => "tbd_events", :action => "index" })
  get("/tbd_events/:id_to_display", { :controller => "tbd_events", :action => "show" })

  # UPDATE
  get("/tbd_events/:prefill_with_id/edit", { :controller => "tbd_events", :action => "edit_form" })
  post("/update_tbd_event/:id_to_modify", { :controller => "tbd_events", :action => "update_row" })

  # DELETE
  get("/delete_tbd_event/:id_to_remove", { :controller => "tbd_events", :action => "destroy_row" })

  #------------------------------

  # Routes for the Schedule resource:

  # CREATE
  get("/schedules/new", { :controller => "schedules", :action => "new_form" })
  post("/create_schedule", { :controller => "schedules", :action => "create_row" })

  # READ
  get("/schedules", { :controller => "schedules", :action => "index" })
  get("/schedules/:id_to_display", { :controller => "schedules", :action => "show" })

  # UPDATE
  get("/schedules/:prefill_with_id/edit", { :controller => "schedules", :action => "edit_form" })
  post("/update_schedule/:id_to_modify", { :controller => "schedules", :action => "update_row" })

  # DELETE
  get("/delete_schedule/:id_to_remove", { :controller => "schedules", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
