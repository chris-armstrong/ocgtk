(** Keyboard event controller *)

type t = EventController.t

(** Create a new keyboard event controller *)
val new_ : unit -> t

(** {2 Signals} *)

(** Emitted when a key is pressed.
    @param keyval Key value
    @param keycode Hardware keycode
    @param state Modifier state
    @return true to stop event propagation *)
val connect_key_pressed :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.modifier_type list -> bool) ->
  Gobject.handler_id

(** Emitted when a key is released.
    @param keyval Key value
    @param keycode Hardware keycode
    @param state Modifier state *)
val connect_key_released :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.modifier_type list -> unit) ->
  Gobject.handler_id

(** Emitted for modifier-only events.
    @param state Modifier state
    @return true to stop event propagation *)
val connect_modifiers :
  t ->
  callback:(state:Gdk.modifier_type list -> bool) ->
  Gobject.handler_id

(** {2 Methods} *)

(** Forward the event to the IM context.
    @return true if the event was consumed *)
val forward : t -> _ Gdk.event -> bool

(** Get the key group for the last processed event *)
val get_group : t -> int
