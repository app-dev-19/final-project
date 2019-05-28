# == Schema Information
#
# Table name: tbd_events
#
#  id           :integer          not null, primary key
#  event_name   :string
#  event_desc   :string
#  window_begin :time
#  window_end   :time
#  min_length   :integer
#  start_time   :time
#  end_time     :time
#  start_date   :date
#  end_date     :string
#  location     :string
#  creator_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TbdEvent < ApplicationRecord
    
    belongs_to :creator, :class_name => "User"
    has_many :proposed_times, :foreign_key => "meeting_id", :dependent => :destroy
    has_many :memberships, :foreign_key => "event_id", :dependent => :destroy
    has_many :votes, :foreign_key => "event_id", :dependent => :destroy
    has_many :invites, :foreign_key => "event_id", :dependent => :destroy
    
end
