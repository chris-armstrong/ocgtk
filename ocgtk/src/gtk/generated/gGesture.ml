(* Signal class defined in ggesture_signals.ml *)

class type gesture_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Ggesture_signals.gesture_signals
    method get_device : unit -> Ocgtk_gdk.Gdk.Device.device_t option
    method get_group : unit -> Gesture.t list
    method get_last_event : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t option -> Ocgtk_gdk.Gdk.Event.event_t option
    method get_last_updated_sequence : unit -> Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t option
    method get_sequence_state : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t -> Gtk_enums.eventsequencestate
    method get_sequences : unit -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t list
    method group : gesture_t -> unit
    method handles_sequence : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t option -> bool
    method is_active : unit -> bool
    method is_grouped_with : gesture_t -> bool
    method is_recognized : unit -> bool
    method set_sequence_state : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t -> Gtk_enums.eventsequencestate -> bool
    method set_state : Gtk_enums.eventsequencestate -> bool
    method ungroup : unit -> unit
    method n_points : int
    method as_gesture : Gesture.t
end

(* High-level class for Gesture *)
class gesture (obj : Gesture.t) : gesture_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Ggesture_signals.gesture_signals obj

  method get_device : unit -> Ocgtk_gdk.Gdk.Device.device_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Device.device ret) (Gesture.get_device obj)

  method get_group : unit -> Gesture.t list =
    fun () ->
      (Gesture.get_group obj)

  method get_last_event : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t option -> Ocgtk_gdk.Gdk.Event.event_t option =
    fun sequence ->
      let sequence = Option.map (fun (c) -> c#as_event_sequence) sequence in
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Event.event ret) (Gesture.get_last_event obj sequence)

  method get_last_updated_sequence : unit -> Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Event_sequence.event_sequence ret) (Gesture.get_last_updated_sequence obj)

  method get_sequence_state : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t -> Gtk_enums.eventsequencestate =
    fun sequence ->
      let sequence = sequence#as_event_sequence in
      (Gesture.get_sequence_state obj sequence)

  method get_sequences : unit -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t list =
    fun () ->
      (Gesture.get_sequences obj)

  method group : gesture_t -> unit =
    fun gesture ->
      let gesture = gesture#as_gesture in
      (Gesture.group obj gesture)

  method handles_sequence : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t option -> bool =
    fun sequence ->
      let sequence = Option.map (fun (c) -> c#as_event_sequence) sequence in
      (Gesture.handles_sequence obj sequence)

  method is_active : unit -> bool =
    fun () ->
      (Gesture.is_active obj)

  method is_grouped_with : gesture_t -> bool =
    fun other ->
      let other = other#as_gesture in
      (Gesture.is_grouped_with obj other)

  method is_recognized : unit -> bool =
    fun () ->
      (Gesture.is_recognized obj)

  method set_sequence_state : Ocgtk_gdk.Gdk.Event_sequence.event_sequence_t -> Gtk_enums.eventsequencestate -> bool =
    fun sequence state ->
      let sequence = sequence#as_event_sequence in
      (Gesture.set_sequence_state obj sequence state)

  method set_state : Gtk_enums.eventsequencestate -> bool =
    fun state ->
      (Gesture.set_state obj state)

  method ungroup : unit -> unit =
    fun () ->
      (Gesture.ungroup obj)

  method n_points = Gesture.get_n_points obj

    method as_gesture = obj
end

