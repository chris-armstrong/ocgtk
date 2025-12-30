(* High-level class for AsyncResult *)
class async_result (obj : Async_result.t) = object (self)

  method legacy_propagate_error : unit -> (bool, GError.t) result =
    fun () ->
      (Async_result.legacy_propagate_error obj)

    method as_async_result = obj
end

