class type recent_data_t = object
  method as_recent_data : Raw.Recent_data.t
end

class recent_data : Raw.Recent_data.t -> recent_data_t
