(** An event related to drag and drop operations.

    Its methods, signals and properties are on {!class-type-dnd_event_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Dnd_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DNDEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to drag and drop operations. *)
class type dnd_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_drop : unit -> Drop.drop_t option
  (** Gets the [GdkDrop] object from a DND event. *)

  (** {2:conversions Conversions} *)

  method as_dnd_event : Raw.Dnd_event.t
end

class dnd_event : Raw.Dnd_event.t -> dnd_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Dnd_event.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
