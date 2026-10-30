class type gesture_single_t = object
  inherit Gesture.gesture_t

  (** {2:methods Methods} *)

  method get_button : unit -> int
  (** Returns the button number [gesture] listens for.

      If this is 0, the gesture reacts to any button press. *)

  method get_current_button : unit -> int
  (** Returns the button number currently interacting with [gesture], or 0 if
      there is none. *)

  method get_current_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option
  (** Returns the event sequence currently interacting with [gesture].

      This is only meaningful if [Gtk.Gesture.is_active] returns [true]. *)

  method get_exclusive : unit -> bool
  (** Gets whether a gesture is exclusive.

      For more information, see [Gtk.GestureSingle.set_exclusive]. *)

  method get_touch_only : unit -> bool
  (** Returns [true] if the gesture is only triggered by touch events. *)

  method set_button : int -> unit
  (** Sets the button number [gesture] listens to.

      If non-0, every button press from a different button number will be
      ignored. Touch events implicitly match with button 1. *)

  method set_exclusive : bool -> unit
  [@@ocaml.doc
    "Sets whether [gesture] is exclusive.\n\n\
     An exclusive gesture will only handle pointer and \"pointer emulated\"\n\
     touch events, so at any given time, there is only one sequence able\n\
     to interact with those."]

  method set_touch_only : bool -> unit
  (** Sets whether to handle only touch events.

      If [touch_only] is [true], [gesture] will only handle events of type
      [GDK_TOUCH_BEGIN], [GDK_TOUCH_UPDATE] or [GDK_TOUCH_END]. If [false],
      mouse events will be handled too. *)

  (** {2:conversions Conversions} *)

  method as_gesture_single : Raw.Gesture_single.t
end

(* High-level class for GestureSingle *)
class gesture_single (obj : Raw.Gesture_single.t) : gesture_single_t =
  object (self)
    inherit Gesture.gesture (obj :> Raw.Gesture.t)

    method get_button : unit -> int =
      fun () -> Raw.Gesture_single.get_button obj

    method get_current_button : unit -> int =
      fun () -> Raw.Gesture_single.get_current_button obj

    method get_current_sequence :
        unit -> Ocgdk.Event_sequence.event_sequence_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Event_sequence.event_sequence ret)
          (Raw.Gesture_single.get_current_sequence obj)

    method get_exclusive : unit -> bool =
      fun () -> Raw.Gesture_single.get_exclusive obj

    method get_touch_only : unit -> bool =
      fun () -> Raw.Gesture_single.get_touch_only obj

    method set_button : int -> unit =
      fun button -> Raw.Gesture_single.set_button obj button

    method set_exclusive : bool -> unit =
      fun exclusive -> Raw.Gesture_single.set_exclusive obj exclusive

    method set_touch_only : bool -> unit =
      fun touch_only -> Raw.Gesture_single.set_touch_only obj touch_only

    method as_gesture_single = obj
  end
