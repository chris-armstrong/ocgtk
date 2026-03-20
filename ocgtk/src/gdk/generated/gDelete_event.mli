class type delete_event_t = object
    method as_delete_event : Delete_event.t
end

class delete_event : Delete_event.t -> delete_event_t

