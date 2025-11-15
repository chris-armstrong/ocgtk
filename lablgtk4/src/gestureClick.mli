(** Click/button press gesture recognizer *)

type t = EventController.t

(** Create a new click gesture controller *)
val new_ : unit -> t

(** {2 Signals} *)

(** Emitted when button is pressed.
    @param n_press Click count (1 = single, 2 = double, etc.)
    @param x X coordinate
    @param y Y coordinate *)
val connect_pressed :
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  Gobject.handler_id

(** Emitted when button is released.
    @param n_press Click count
    @param x X coordinate
    @param y Y coordinate *)
val connect_released :
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  Gobject.handler_id

(** Emitted when gesture is recognized as a stop event *)
val connect_stopped :
  t ->
  callback:(unit -> unit) ->
  Gobject.handler_id

(** Emitted when click is not paired with release (drag started).
    @param x X coordinate
    @param y Y coordinate
    @param button Button number
    @param sequence Event sequence *)
val connect_unpaired_release :
  t ->
  callback:(x:float -> y:float -> button:int -> unit) ->
  Gobject.handler_id

(** {2 Methods} *)

(** Set which button to respond to (0 = all, 1 = primary, 2 = middle, 3 = right) *)
val set_button : t -> int -> unit

(** Get which button this gesture responds to *)
val get_button : t -> int
