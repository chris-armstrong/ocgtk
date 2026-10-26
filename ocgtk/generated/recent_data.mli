class type recent_data_t = object
  method as_recent_data : Recent_data.t
end

class recent_data : Recent_data.t -> recent_data_t
