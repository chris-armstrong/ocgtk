class async_result : Async_result.t ->
  object
    method legacy_propagate_error : unit -> (bool, GError.t) result
    method as_async_result : Async_result.t
  end

