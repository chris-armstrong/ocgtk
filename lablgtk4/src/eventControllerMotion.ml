(** Mouse motion event controller *)

type t = EventController.t

external new_ : unit -> t = "ml_gtk_event_controller_motion_new"

external connect_enter :
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id = "ml_gtk_event_controller_motion_connect_enter"

external connect_leave :
  t ->
  callback:(unit -> unit) ->
  Gobject.Signal.handler_id = "ml_gtk_event_controller_motion_connect_leave"

external connect_motion :
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id = "ml_gtk_event_controller_motion_connect_motion"

external contains_pointer : t -> bool = "ml_gtk_event_controller_motion_contains_pointer"

external is_pointer : t -> bool = "ml_gtk_event_controller_motion_is_pointer"
