class type async_result_t = object
  (** {2:methods Methods} *)

  method get_source_object : unit -> [ `object_ ] Gobject.obj option
  (** Gets the source object from a [Gio.AsyncResult]. *)

  method legacy_propagate_error : unit -> (bool, GError.t) result
  (** If [res] is a [Gio.SimpleAsyncResult], this is equivalent to
      [Gio.SimpleAsyncResult.propagate_error]. Otherwise it returns [false].

      This can be used for legacy error handling in async [*_finish()] wrapper
      functions that traditionally handled [Gio.SimpleAsyncResult] error returns
      themselves rather than calling into the virtual method. This should not be
      used in new code; [Gio.AsyncResult] errors that are set by virtual methods
      should also be extracted by virtual methods, to enable subclasses to chain
      up correctly. *)

  (** {2:conversions Conversions} *)

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
