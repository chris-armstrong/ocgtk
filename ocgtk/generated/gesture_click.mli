(** Recognizes click gestures.

    It is able to recognize multiple clicks on a nearby zone, which can be
    listened for through the [Gtk.GestureClick::pressed] signal. Whenever time
    or distance between clicks exceed the GTK defaults,
    [Gtk.GestureClick::stopped] is emitted, and the click counter is reset.

    Its methods, signals and properties are on {!class-type-gesture_click_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Gesture_click}. *)

(** The methods, signals and properties of a [GtkGestureClick]. *)
class type gesture_click_t = object
  inherit Gesture_single.gesture_single_t

  method on_pressed :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_released :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_stopped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method as_gesture_click : Raw.Gesture_click.t
end

class gesture_click : Raw.Gesture_click.t -> gesture_click_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_click.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGestureClick], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> gesture_click_t
(** Returns a newly created [GtkGesture] that recognizes single and multiple
    presses. *)
