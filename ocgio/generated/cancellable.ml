class type cancellable_t = object
  method on_cancelled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method cancel : unit -> unit
  method disconnect : int -> unit
  method get_fd : unit -> int
  method is_cancelled : unit -> bool
  method pop_current : unit -> unit
  method push_current : unit -> unit
  method release_fd : unit -> unit
  method reset : unit -> unit
  method set_error_if_cancelled : unit -> (bool, GError.t) result
  method as_cancellable : Raw.Cancellable.t
end

(* High-level class for Cancellable *)
class cancellable (obj : Raw.Cancellable.t) : cancellable_t =
  object (self)
    method on_cancelled ?(after = false) ~callback () =
      Raw.Cancellable.on_cancelled ~after self#as_cancellable ~callback

    method cancel : unit -> unit = fun () -> Raw.Cancellable.cancel obj

    method disconnect : int -> unit =
      fun handler_id -> Raw.Cancellable.disconnect obj handler_id

    method get_fd : unit -> int = fun () -> Raw.Cancellable.get_fd obj

    method is_cancelled : unit -> bool =
      fun () -> Raw.Cancellable.is_cancelled obj

    method pop_current : unit -> unit =
      fun () -> Raw.Cancellable.pop_current obj

    method push_current : unit -> unit =
      fun () -> Raw.Cancellable.push_current obj

    method release_fd : unit -> unit = fun () -> Raw.Cancellable.release_fd obj
    method reset : unit -> unit = fun () -> Raw.Cancellable.reset obj

    method set_error_if_cancelled : unit -> (bool, GError.t) result =
      fun () -> Raw.Cancellable.set_error_if_cancelled obj

    method as_cancellable = obj
  end

let new_ () : cancellable_t = new cancellable (Raw.Cancellable.new_ ())
