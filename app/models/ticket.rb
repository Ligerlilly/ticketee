class Ticket < ActiveRecord::Base
  attr_accessible :description, :title, :assets_attributes, :user
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 10}
  
  belongs_to :project
  belongs_to :user
  
  has_many :assets
  accepts_nested_attributes_for :assets
  
  has_many :comments
  belongs_to :state
end
