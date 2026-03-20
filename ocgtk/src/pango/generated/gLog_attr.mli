class type log_attr_t = object
    method as_log_attr : Log_attr.t
end

class log_attr : Log_attr.t -> log_attr_t

