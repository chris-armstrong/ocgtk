(** Keyboard event controller *)

type t = EventController.t

external new_ : unit -> t = "ml_gtk_event_controller_key_new"

external connect_key_pressed :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.modifier_type list -> bool) ->
  Gobject.handler_id = "ml_gtk_event_controller_key_connect_key_pressed"

external connect_key_released :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.modifier_type list -> unit) ->
  Gobject.handler_id = "ml_gtk_event_controller_key_connect_key_released"

external connect_modifiers :
  t ->
  callback:(state:Gdk.modifier_type list -> bool) ->
  Gobject.handler_id = "ml_gtk_event_controller_key_connect_modifiers"

external forward : t -> _ Gdk.event -> bool = "ml_gtk_event_controller_key_forward"

external get_group : t -> int = "ml_gtk_event_controller_key_get_group"
