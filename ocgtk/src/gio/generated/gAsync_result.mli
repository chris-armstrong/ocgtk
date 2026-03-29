class type async_result_t = object
    method get_source_object : unit -> [`object_] Gobject.obj option
    method legacy_propagate_error : unit -> (bool, GError.t) result
    method as_async_result : Async_result.t
end

class async_result : Async_result.t -> async_result_t

