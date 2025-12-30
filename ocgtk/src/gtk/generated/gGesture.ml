(* Signal class defined in ggesture_signals.ml *)

(* High-level class for Gesture *)
class gesture (obj : Gesture.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture.as_event_controller obj)
  inherit Ggesture_signals.gesture_signals obj

  method group : 'p1. (<as_gesture: Gesture.t; ..> as 'p1) -> unit =
    fun gesture ->
      let gesture = gesture#as_gesture in
      (Gesture.group obj gesture)

  method is_active : unit -> bool =
    fun () ->
      (Gesture.is_active obj)

  method is_grouped_with : 'p1. (<as_gesture: Gesture.t; ..> as 'p1) -> bool =
    fun other ->
      let other = other#as_gesture in
      (Gesture.is_grouped_with obj other)

  method is_recognized : unit -> bool =
    fun () ->
      (Gesture.is_recognized obj)

  method set_state : Gtk_enums.eventsequencestate -> bool =
    fun state ->
      (Gesture.set_state obj state)

  method ungroup : unit -> unit =
    fun () ->
      (Gesture.ungroup obj)

  method n_points = Gesture.get_n_points obj

  method as_event_controller = (Gesture.as_event_controller obj)
    method as_gesture = obj
end

