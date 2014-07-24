class Project < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: true
  has_many :tickets, dependent: :delete_all
  has_many :permissions, as: :thing
  scope :reable_by, lambda { |user| 
    joins(:permissions).where(permissions: { action: "view", user_id: user.id }) }
    
  def self.for(user)
    user.admin? ? Project : Project.reable_by(user)
  end
  def last_ticket
    tickets.last
  end
  def title
    name
  end
end
