(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerLegacy: EventControllerLegacy *)

type t = [ `event_controller_legacy | `event_controller | `object_ ] Gobject.obj
(** Provides raw access to the event stream.

    It should only be used as a last resort if none of the other event
    controllers or gestures do the job. *)

external new_ : unit -> t = "ml_gtk_event_controller_legacy_new"
(** Create a new EventControllerLegacy *)

(* Methods *)
val on_event :
  ?after:bool ->
  t ->
  callback:(event:Ocgtk_gdk.Gdk.Wrappers.Event.t -> bool) ->
  Gobject.Signal.handler_id
