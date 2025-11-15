(** Click/button press gesture recognizer *)

type t = EventController.t

external new_ : unit -> t = "ml_gtk_gesture_click_new"

external connect_pressed :
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  Gobject.signal_id = "ml_gtk_gesture_click_connect_pressed"

external connect_released :
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  Gobject.signal_id = "ml_gtk_gesture_click_connect_released"

external connect_stopped :
  t ->
  callback:(unit -> unit) ->
  Gobject.signal_id = "ml_gtk_gesture_click_connect_stopped"

external connect_unpaired_release :
  t ->
  callback:(x:float -> y:float -> button:int -> unit) ->
  Gobject.signal_id = "ml_gtk_gesture_click_connect_unpaired_release"

external set_button : t -> int -> unit = "ml_gtk_gesture_click_set_button"

external get_button : t -> int = "ml_gtk_gesture_click_get_button"
