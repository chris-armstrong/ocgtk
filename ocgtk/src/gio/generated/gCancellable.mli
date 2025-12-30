class cancellable : Cancellable.t ->
  object
    inherit Gcancellable_signals.cancellable_signals
    method cancel : unit -> unit
    method get_fd : unit -> int
    method is_cancelled : unit -> bool
    method pop_current : unit -> unit
    method push_current : unit -> unit
    method release_fd : unit -> unit
    method reset : unit -> unit
    method set_error_if_cancelled : unit -> (bool, GError.t) result
    method as_cancellable : Cancellable.t
  end

