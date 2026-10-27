(** An event related to closing a top-level surface.

    Its methods, signals and properties are on {!class-type-delete_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Delete_event}. *)

(** The methods, signals and properties of a [GdkDeleteEvent]. *)
class type delete_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method as_delete_event : Raw.Delete_event.t
end

class delete_event : Raw.Delete_event.t -> delete_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Delete_event.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDeleteEvent], give one already wrapped. *)
