# == Schema Information
#
# Table name: proposed_times
#
#  id         :integer          not null, primary key
#  start_time :time
#  end_time   :time
#  start_date :date
#  end_date   :date
#  meeting_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProposedTime < ApplicationRecord
    
    belongs_to :meeting, :class_name => "TbdEvent"
    has_many :votes, :dependent => :destroy
    
end
