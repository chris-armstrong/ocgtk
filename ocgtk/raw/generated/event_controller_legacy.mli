(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerLegacy: EventControllerLegacy *)

(** Provides raw access to the event stream.

    It should only be used as a last resort if none of the other event
    controllers or gestures do the job.

    The class built on this module is in {!Ocgtk.Event_controller_legacy}. *)

type t = [ `event_controller_legacy | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_event_controller_legacy_get_type"

external new_ : unit -> t = "ml_gtk_event_controller_legacy_new"
(** Create a new EventControllerLegacy *)

(* Methods *)
val on_event :
  ?after:bool ->
  t ->
  callback:(event:Ocgdk_raw.Event.t -> bool) ->
  Gobject.Signal.handler_id
