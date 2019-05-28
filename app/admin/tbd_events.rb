ActiveAdmin.register TbdEvent do
  permit_params :event_name, :event_desc, :window_begin, :window_end, :min_length, :start_time, :end_time, :start_date, :end_date, :location, :creator_id

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
