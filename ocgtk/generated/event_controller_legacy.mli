(** Provides raw access to the event stream.

    It should only be used as a last resort if none of the other event
    controllers or gestures do the job.

    Its methods, signals and properties are on
    {!class-type-event_controller_legacy_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Event_controller_legacy}. *)

(** {b The methods, signals and properties of a [EventControllerLegacy].}

    Provides raw access to the event stream.

    It should only be used as a last resort if none of the other event
    controllers or gestures do the job. *)
class type event_controller_legacy_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_event :
    ?after:bool ->
    callback:(event:Ocgdk.Event.event_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted for each GDK event delivered to [controller]. *)

  method as_event_controller_legacy : Raw.Event_controller_legacy.t
end

class event_controller_legacy :
  Raw.Event_controller_legacy.t ->
  event_controller_legacy_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller_legacy.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> event_controller_legacy_t
(** Creates a new legacy event controller. *)
