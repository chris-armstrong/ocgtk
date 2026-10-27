(** [GCancellable] allows operations to be cancelled.

    [GCancellable] is a thread-safe operation cancellation stack used throughout
    GIO to allow for cancellation of synchronous and asynchronous operations.

    Its methods, signals and properties are on {!class-type-cancellable_t}. The
    functions it is built on are in {!Ocgio.Raw.Cancellable}. *)

(** The methods, signals and properties of a [GCancellable]. *)
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

class cancellable : Raw.Cancellable.t -> cancellable_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Cancellable.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GCancellable], give one already wrapped. *)

val new_ : unit -> cancellable_t
