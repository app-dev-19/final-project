# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  event_name :string
#  event_cal  :string
#  start_time :time
#  end_time   :time
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ApplicationRecord
    
    belongs_to :owner, :class_name => "User"
    
end
