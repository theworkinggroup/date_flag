module DateFlag
  VERSION = '0.0.3'
  
  # Usage:
  #
  # class MyModel < ActiveRecord::Base
  #   date_flag :flagged_at, :action => :flag
  # end
  #
  # m = MyModel.new
  # m.flagged?     # => false
  # m.flag!        # Assigns flag_at to current time
  # m.flag = true  # Same as flag!
  # m.flagged?     # => true
  
  def date_flag(field, options =  { })
    action = (options[:action] ? options[:action] : field.to_s.sub(/_at$/, '')).to_sym
    query = (options[:query] and options[:query].to_sym or action)
    
    define_method(:"#{action}=") do |value|
      # The action= mutator method is used to manipulate the trigger time.
      # Values of nil, false, empty string, '0' or 0 are presumed to be
      # false and will nil out the time. A DateTime, Date or Time object
      # will be saved as-is, and anything else will just assign the current
      # time.
      
      unless (read_attribute(field))
        case (value)
        when nil, false, '', '0', 0:
          write_attribute(field, nil)
        when DateTime, Date, Time:
          write_attribute(field, value)
        else
          write_attribute(field, Time.now.utc)
        end
      end
    end

    define_method(:"#{action}?") do
      # The action? accessor method will return true if the date is defined 
      # and is prior to the current time, or false otherwise.
      
      value = read_attribute(field)
      
      value ? (value <= Time.now.utc) : false
    end
  
    define_method(:"#{action}!") do |*at_time|
      # The action! method is used to set the trigger time. If the time is
      # already defined and is in the past, then the time is left unchanged.
      # If it is undefined or in the future, then the current time is
      # substituted.
      
      value = read_attribute(field)
      
      at_time = at_time.first || Time.now.utc
      
      unless (value and (value <= at_time))
        write_attribute(field, at_time)
        save!
      end
    end
  end
end
