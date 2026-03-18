(* Signal class defined in ggesture_signals.ml *)

(* High-level class for Gesture *)
class gesture (obj : Gesture.t) = object (self)
  inherit Ggesture_signals.gesture_signals obj

  method get_device : unit -> Ocgtk_gdk.Gdk.device option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.device ret) (Gesture.get_device obj)

  method get_last_event : 'p1. (#Ocgtk_gdk.Gdk.event_sequence as 'p1) option -> Ocgtk_gdk.Gdk.event option =
    fun sequence ->
      let sequence = Option.map (fun (c) -> c#as_event_sequence) sequence in
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.event ret) (Gesture.get_last_event obj sequence)

  method get_last_updated_sequence : unit -> Ocgtk_gdk.Gdk.event_sequence option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.event_sequence ret) (Gesture.get_last_updated_sequence obj)

  method get_sequence_state : 'p1. (#Ocgtk_gdk.Gdk.event_sequence as 'p1) -> Gtk_enums.eventsequencestate =
    fun sequence ->
      let sequence = sequence#as_event_sequence in
      (Gesture.get_sequence_state obj sequence)

  method group : 'p1. (<as_gesture: Gesture.t; ..> as 'p1) -> unit =
    fun gesture ->
      let gesture = gesture#as_gesture in
      (Gesture.group obj gesture)

  method handles_sequence : 'p1. (#Ocgtk_gdk.Gdk.event_sequence as 'p1) option -> bool =
    fun sequence ->
      let sequence = Option.map (fun (c) -> c#as_event_sequence) sequence in
      (Gesture.handles_sequence obj sequence)

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

  method set_sequence_state : 'p1. (#Ocgtk_gdk.Gdk.event_sequence as 'p1) -> Gtk_enums.eventsequencestate -> bool =
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

