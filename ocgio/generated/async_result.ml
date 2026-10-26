class type async_result_t = object
  method get_source_object : unit -> [ `object_ ] Gobject.obj option
  method legacy_propagate_error : unit -> (bool, GError.t) result
  method as_async_result : Raw.Async_result.t
end

(* High-level class for AsyncResult *)
class async_result (obj : Raw.Async_result.t) : async_result_t =
  object (self)
    method get_source_object : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Async_result.get_source_object obj

    method legacy_propagate_error : unit -> (bool, GError.t) result =
      fun () -> Raw.Async_result.legacy_propagate_error obj

    method as_async_result = obj
  end
