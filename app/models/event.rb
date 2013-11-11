require 'date'

class Event < ActiveRecord::Base
  validates :date, :organizer_name, presence: true, message: " is not a valid size"
  validates :title, presence: true, uniqueness: true, message: " is not a valid size"
  validate :date_cannot_be_in_the_past
  validates_format_of :organizer_email , :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "The fucking event happened already")
    end
  end    
 
end



