(** Recognizes click gestures.

    Its methods, signals and properties are on {!class-type-gesture_click_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_click}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GestureClick].}

    Inherits from:
    {{!Ocgtk.Gesture_single.class-type-gesture_single_t}Ocgtk.Gesture_single}

    Recognizes click gestures.

    It is able to recognize multiple clicks on a nearby zone, which can be
    listened for through the
    {{!Ocgtk.Gesture_click.class-type-gesture_click_t.method-on_pressed}[Gtk.GestureClick::pressed]}
    signal. Whenever time or distance between clicks exceed the GTK defaults,
    {{!Ocgtk.Gesture_click.class-type-gesture_click_t.method-on_stopped}[Gtk.GestureClick::stopped]}
    is emitted, and the click counter is reset. *)
class type gesture_click_t = object
  inherit Gesture_single.gesture_single_t

  (** {2:signals Signals} *)

  method on_pressed :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a button or touch press happens. *)

  method on_released :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a button or touch is released.

      [n_press] will report the number of press that is paired to this event,
      note that [Gtk.GestureClick::stopped] may have been emitted between the
      press and its release, [n_press] will only start over at the next press.
  *)

  method on_stopped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever any time/distance threshold has been exceeded. *)

  (** {2:conversions Conversions} *)

  method as_gesture_click : Raw.Gesture_click.t
end

class gesture_click : Raw.Gesture_click.t -> gesture_click_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_click.t}. *)

(** {1:description Description}

    Recognizes click gestures.

    It is able to recognize multiple clicks on a nearby zone, which can be
    listened for through the
    {{!Ocgtk.Gesture_click.class-type-gesture_click_t.method-on_pressed}[Gtk.GestureClick::pressed]}
    signal. Whenever time or distance between clicks exceed the GTK defaults,
    {{!Ocgtk.Gesture_click.class-type-gesture_click_t.method-on_stopped}[Gtk.GestureClick::stopped]}
    is emitted, and the click counter is reset. *)

(** {1:constructors Constructors} *)

val new_ : unit -> gesture_click_t
(** Returns a newly created [GtkGesture] that recognizes single and multiple
    presses. *)
