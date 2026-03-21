class type log_attr_t = object
    method as_log_attr : Log_attr.t
end

(* High-level class for LogAttr *)
class log_attr (obj : Log_attr.t) : log_attr_t = object (self)

    method as_log_attr = obj
end

