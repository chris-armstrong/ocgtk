(** Provides raw access to the event stream.

    Its methods, signals and properties are on
    {!class-type-event_controller_legacy_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Event_controller_legacy}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EventControllerLegacy].}

    Inherits from:
    {{!Ocgtk.Event_controller.class-type-event_controller_t}Ocgtk.Event_controller}

    Provides raw access to the event stream.

    It should only be used as a last resort if none of the other event
    controllers or gestures do the job. *)
class type event_controller_legacy_t = object
  inherit Event_controller.event_controller_t

  (** {2:signals Signals} *)

  method on_event :
    ?after:bool ->
    callback:(event:Ocgdk.Event.event_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted for each GDK event delivered to [controller]. *)

  (** {2:conversions Conversions} *)

  method as_event_controller_legacy : Raw.Event_controller_legacy.t
end

class event_controller_legacy :
  Raw.Event_controller_legacy.t ->
  event_controller_legacy_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller_legacy.t}. *)

(** {1:description Description}

    Provides raw access to the event stream.

    It should only be used as a last resort if none of the other event
    controllers or gestures do the job. *)

(** {1:constructors Constructors} *)

val new_ : unit -> event_controller_legacy_t
(** Creates a new legacy event controller. *)
