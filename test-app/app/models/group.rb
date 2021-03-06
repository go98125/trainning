class Group < ActiveRecord::Base
  has_many :posts
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  has_many :group_users
  has_many :participated_groups, :through => :group_users, :source => :group

  validates :title, :presence => true

  def editable_by?(user)
    user && user == owner
  end
end