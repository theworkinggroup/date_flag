module DateFlag
  VERSION = '0.0.1'
  
  def date_flag(field, options =  { })
    action = (options[:action] ? options[:action] : field.to_s.sub(/_at$/, '')).to_sym
    query = (options[:query] and options[:query].to_sym or action)
    
    define_method(:"#{action}=") do |value|
      unless (read_attribute(field))
        case (value)
        when nil, false, '', '0':
          write_attribute(field, nil)
        when DateTime, Date, Time:
          write_attribute(field, value)
        else
          write_attribute(field, Time.now.utc)
        end
      end
    end

    define_method(:"#{action}?") do
      !!(read_attribute(field))
    end
  
    define_method(:"#{action}!") do
      unless (read_attribute(field))
        write_attribute(field, Time.now.utc)
        save!
      end
    end
  end
end
