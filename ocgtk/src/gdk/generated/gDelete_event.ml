class type delete_event_t = object
    method as_delete_event : Delete_event.t
end

(* High-level class for DeleteEvent *)
class delete_event (obj : Delete_event.t) : delete_event_t = object (self)

    method as_delete_event = obj
end

