(** An event related to drag and drop operations.

    Its methods, signals and properties are on {!class-type-dnd_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Dnd_event}. *)

(** The methods, signals and properties of a [GdkDNDEvent]. *)
class type dnd_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_drop : unit -> Drop.drop_t option
  method as_dnd_event : Raw.Dnd_event.t
end

class dnd_event : Raw.Dnd_event.t -> dnd_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Dnd_event.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDNDEvent], give one already wrapped. *)
