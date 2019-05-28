# == Schema Information
#
# Table name: votes
#
#  id               :integer          not null, primary key
#  proposed_time_id :integer
#  voter_id         :integer
#  event_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Vote < ApplicationRecord
    
    belongs_to :voter, :class_name => "User"
    belongs_to :event, :class_name => "TbdEvent"
    belongs_to :proposed_time
    
end
