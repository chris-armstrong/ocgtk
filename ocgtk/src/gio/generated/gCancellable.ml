(* Signal class defined in gcancellable_signals.ml *)

(* High-level class for Cancellable *)
class cancellable (obj : Cancellable.t) = object (self)
  inherit Gcancellable_signals.cancellable_signals obj

  method cancel : unit -> unit =
    fun () ->
      (Cancellable.cancel obj)

  method get_fd : unit -> int =
    fun () ->
      (Cancellable.get_fd obj)

  method is_cancelled : unit -> bool =
    fun () ->
      (Cancellable.is_cancelled obj)

  method pop_current : unit -> unit =
    fun () ->
      (Cancellable.pop_current obj)

  method push_current : unit -> unit =
    fun () ->
      (Cancellable.push_current obj)

  method release_fd : unit -> unit =
    fun () ->
      (Cancellable.release_fd obj)

  method reset : unit -> unit =
    fun () ->
      (Cancellable.reset obj)

  method set_error_if_cancelled : unit -> (bool, GError.t) result =
    fun () ->
      (Cancellable.set_error_if_cancelled obj)

    method as_cancellable = obj
end

