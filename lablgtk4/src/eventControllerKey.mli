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
  callback:(keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> bool) ->
  Gobject.Signal.handler_id

(** Emitted when a key is released.
    @param keyval Key value
    @param keycode Hardware keycode
    @param state Modifier state *)
val connect_key_released :
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> unit) ->
  Gobject.Signal.handler_id

(** Emitted for modifier-only events.
    @param state Modifier state
    @return true to stop event propagation *)
val connect_modifiers :
  t ->
  callback:(state:Gdk.Tags.modifier_type list -> bool) ->
  Gobject.Signal.handler_id

(** {2 Methods} *)

(** Forward key events to a widget (for IM context handling).
    @return true if the event was consumed *)
val forward : t -> [`widget] Gobject.obj -> bool

(** Get the key group for the last processed event *)
val get_group : t -> int
