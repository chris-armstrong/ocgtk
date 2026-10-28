(** An event related to closing a top-level surface.

    Its methods, signals and properties are on {!class-type-delete_event_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Delete_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DeleteEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to closing a top-level surface. *)
class type delete_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:conversions Conversions} *)

  method as_delete_event : Raw.Delete_event.t
end

class delete_event : Raw.Delete_event.t -> delete_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Delete_event.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
