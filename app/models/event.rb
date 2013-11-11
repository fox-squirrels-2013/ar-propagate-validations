class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

# Question: What is allowing active record to change the date into a particular format?

class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    time = Time.new
    todays_date = time.year.to_s + "-" + time.month.to_s + "-" + time.day.to_s
    unless (value.to_s >= todays_date)
      record.errors[attribute] << (options[:message] || "is in the past")
    end
  end
end

class Event < ActiveRecord::Base
  validates :organizer_name, :date, :title, presence: true
  validates :organizer_email, presence: true, email: true
  validates :date, presence: true, date: true
end


# ToDo:
# validate date is not in the past -- check
# validate email address -- check
# user is informed that validation failed
# form remains populated
# use flash to present errors by the field

# Stretch:
# use datepicker or similar
# make date format more flexible using rubygem chronic or similar
