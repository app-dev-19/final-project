# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ApplicationRecord
    
    def all_events
        events = TbdEvent.all.where({:id => self.event_id})
        return(events)
    end
    
    belongs_to :member, :class_name => "User"
    belongs_to :event, :class_name => "TbdEvent"
    
end
