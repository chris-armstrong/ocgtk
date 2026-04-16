(* Signal class defined in gcancellable_signals.ml *)

class type cancellable_t = object
  inherit Gcancellable_signals.cancellable_signals
  method cancel : unit -> unit
  method disconnect : int -> unit
  method get_fd : unit -> int
  method is_cancelled : unit -> bool
  method pop_current : unit -> unit
  method push_current : unit -> unit
  method release_fd : unit -> unit
  method reset : unit -> unit
  method set_error_if_cancelled : unit -> (bool, GError.t) result
  method as_cancellable : Cancellable.t
end

(* High-level class for Cancellable *)
class cancellable (obj : Cancellable.t) : cancellable_t =
  object (self)
    inherit Gcancellable_signals.cancellable_signals obj
    method cancel : unit -> unit = fun () -> Cancellable.cancel obj

    method disconnect : int -> unit =
      fun handler_id -> Cancellable.disconnect obj handler_id

    method get_fd : unit -> int = fun () -> Cancellable.get_fd obj
    method is_cancelled : unit -> bool = fun () -> Cancellable.is_cancelled obj
    method pop_current : unit -> unit = fun () -> Cancellable.pop_current obj
    method push_current : unit -> unit = fun () -> Cancellable.push_current obj
    method release_fd : unit -> unit = fun () -> Cancellable.release_fd obj
    method reset : unit -> unit = fun () -> Cancellable.reset obj

    method set_error_if_cancelled : unit -> (bool, GError.t) result =
      fun () -> Cancellable.set_error_if_cancelled obj

    method as_cancellable = obj
  end

let new_ () : cancellable_t = new cancellable (Cancellable.new_ ())
