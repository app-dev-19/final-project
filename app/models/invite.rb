# == Schema Information
#
# Table name: invites
#
#  id            :integer          not null, primary key
#  email         :string
#  event_id      :integer
#  invitor_id    :integer
#  invite_status :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Invite < ApplicationRecord
    
    belongs_to :invitor, :class_name => "User"
    belongs_to :event, :class_name => "TbdEvent"
    
end
