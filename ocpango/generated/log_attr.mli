class type log_attr_t = object
  method as_log_attr : Raw.Log_attr.t
end

class log_attr : Raw.Log_attr.t -> log_attr_t
