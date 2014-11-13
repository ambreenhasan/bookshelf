class BookOwnership < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def time_difference
    seconds_since = (Time.now.to_i - self.created_at.to_i)
    if seconds_since >= 86400 #seconds per day
      return days(seconds_since)
    elsif seconds_since >= 3600 #seconds per hour
      return hours(seconds_since)
    elsif seconds_since >= 60
      return minutes(seconds_since)
    else
      return "#{seconds_since} seconds ago"
    end
  end

  def days(seconds_since)
    days = seconds_since / 3600 / 24
    "#{days} days ago"
  end

  def hours(seconds_since)
    hours = seconds_since / 3600
    "#{hours} hours ago"
  end

  def minutes(seconds_since)
    minutes = seconds_since / 60
    "#{minutes} minutes ago"
  end
end
