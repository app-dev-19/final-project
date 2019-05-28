# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  gmail                  :string
#  first_name             :string
#  last_name              :string
#  google_cred            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  
  has_many :schedules, :foreign_key => "owner_id", :dependent => :destroy
  has_many :meetings, :class_name => "TbdEvent", :foreign_key => "creator_id", :dependent => :destroy
  has_many :memberships, :foreign_key => "member_id", :dependent => :destroy
  has_many :votes, :foreign_key => "voter_id", :dependent => :destroy
  has_many :invites, :foreign_key => "invitor_id", :dependent => :destroy
  
end
